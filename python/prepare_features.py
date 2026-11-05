#!/usr/bin/env python3
"""Compute log-mel patches and FP32 embeddings for the 8 ESC-50 categories used by the ARARA head.

Output: build/features_esc50.npz with
  logmel  (N,96,64) float32   patches (10 per 5 s clip, YAMNet framing)
  emb     (N,1024)  float32   FP32 YAMNet embeddings
  cat     (N,)      int       index into CATEGORIES
  clip    (N,)      int       clip index (0..319) in `clip_files`
  patch   (N,)      int       patch index within the clip (0..9)
  fold    (N,)      int       ESC-50 fold (1..5)
"""

import os
import sys
import numpy as np

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from arara import frontend, yamnet_np, dataset, BUILD_DIR   # noqa: E402

# Order of the 8 outputs of the shipped head (determined empirically, see README / evaluate.py)
CATEGORIES = ["chainsaw", "rain", "engine", "hand_saw", "chirping_birds", "thunderstorm", "wind", "insects"]


def main():
    os.makedirs(BUILD_DIR, exist_ok=True)
    esc = dataset.ESC50()
    net = yamnet_np.YamnetFP32()
    logmel, cat, clip, patch, fold = [], [], [], [], []
    files = []
    for ci, name in enumerate(CATEGORIES):
        for r in sorted(esc.clips_of(name), key=lambda r: r["filename"]):
            x = esc.load(r["filename"])
            p = frontend.waveform_to_patches(x)
            clip_id = len(files)
            files.append(r["filename"])
            for k in range(len(p)):
                logmel.append(p[k]); cat.append(ci); clip.append(clip_id); patch.append(k); fold.append(r["fold"])
        print(f"[*] {name}: {len(files)} clips so far")
    logmel = np.stack(logmel).astype(np.float32)
    emb = np.concatenate([net.forward(logmel[i:i + 64]) for i in range(0, len(logmel), 64)])
    out = os.path.join(BUILD_DIR, "features_esc50.npz")
    np.savez_compressed(out, logmel=logmel, emb=emb, cat=np.array(cat), clip=np.array(clip),
                        patch=np.array(patch), fold=np.array(fold), clip_files=np.array(files),
                        categories=np.array(CATEGORIES))
    print(f"[+] {len(logmel)} patches from {len(files)} clips -> {out}")


if __name__ == "__main__":
    main()

