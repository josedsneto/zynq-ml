"""Audio datasets: ESC-50 (from the zip in data/) and the ARARA field-test recordings."""

import csv
import io
import os
import zipfile

import numpy as np
from scipy.io import wavfile
from scipy.signal import resample_poly

from . import ESC50_ZIP

SR = 16000
ESC50_PREFIX = "ESC-50-master/"

# ESC-50 category ids used by the paper: three target classes ...
ESC50_TARGET_CATEGORIES = ["chainsaw", "engine", "hand_saw"]   # ESC-50 category names (idx 41, 44, 49)
FOURCLASS_NAMES = ["chainsaw", "engine", "hand_saw", "others"]


def to_float_mono_16k(sr, data):
    """int16/int32/float wav array -> float32 mono at 16 kHz in [-1, 1]."""
    data = np.asarray(data)
    if data.dtype == np.int16:
        x = data.astype(np.float32) / 32768.0
    elif data.dtype == np.int32:
        x = data.astype(np.float32) / 2147483648.0
    elif data.dtype == np.uint8:
        x = (data.astype(np.float32) - 128.0) / 128.0
    else:
        x = data.astype(np.float32)
    if x.ndim > 1:
        x = x.mean(axis=1)
    if sr != SR:
        from math import gcd
        g = gcd(int(sr), SR)
        x = resample_poly(x, SR // g, int(sr) // g).astype(np.float32)
    return x.astype(np.float32)


class ESC50:
    """Random access to ESC-50 clips straight out of the downloaded zip (no extraction needed)."""

    def __init__(self, zip_path=ESC50_ZIP):
        self.zip_path = zip_path
        self._zf = None
        with zipfile.ZipFile(zip_path) as zf:
            with zf.open(ESC50_PREFIX + "meta/esc50.csv") as fh:
                rows = list(csv.DictReader(io.TextIOWrapper(fh, encoding="utf-8")))
        self.meta = rows
        for r in self.meta:
            r["target"] = int(r["target"])
            r["fold"] = int(r["fold"])
        self.cat_to_id = {r["category"]: r["target"] for r in rows}
        self.id_to_cat = {v: k for k, v in self.cat_to_id.items()}

    def _zip(self):
        if self._zf is None:
            self._zf = zipfile.ZipFile(self.zip_path)
        return self._zf

    def clips_of(self, category):
        return [r for r in self.meta if r["category"] == category]

    def load(self, filename):
        with self._zip().open(ESC50_PREFIX + "audio/" + filename) as fh:
            sr, data = wavfile.read(io.BytesIO(fh.read()))
        return to_float_mono_16k(sr, data)

    def load_int16(self, filename):
        with self._zip().open(ESC50_PREFIX + "audio/" + filename) as fh:
            sr, data = wavfile.read(io.BytesIO(fh.read()))
        assert sr == SR and data.dtype == np.int16
        return data


def load_wav(path):
    sr, data = wavfile.read(path)
    return to_float_mono_16k(sr, data)
