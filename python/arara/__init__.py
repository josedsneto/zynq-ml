"""ARARA on Zynq: YAMNet + refined classifier head, FP32 reference and INT8 golden model.

Modules
-------
frontend   : waveform -> log-mel patches (identical maths to the bare-metal C frontend)
yamnet_np  : FP32 YAMNet backbone (NumPy, BN folded) -> 1024-d embeddings
head       : the ARARA refined classifier head (1024 -> 512 ReLU -> 8 softmax -> 4 classes)
dataset    : ESC-50 / field-test audio access and the 4-class label mapping
quant      : post-training INT8 quantisation + bit-exact integer golden model
export     : binary/C export of weights, test vectors and audio for the Zynq firmware
metrics    : accuracy / precision / recall / F1 / confusion matrix helpers
"""

import os

REPO_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", ".."))
THIRD_PARTY = os.path.join(REPO_DIR, "third_party")
YAMNET_H5 = os.path.join(THIRD_PARTY, "yamnet", "yamnet.h5")
YAMNET_CLASSMAP = os.path.join(THIRD_PARTY, "yamnet", "yamnet_class_map.csv")
HEAD_H5 = os.path.join(THIRD_PARTY, "arara", "esc50_forest_Demo.h5")
ESC50_ZIP = os.path.join(REPO_DIR, "data", "ESC-50-master.zip")
BUILD_DIR = os.path.join(REPO_DIR, "build")

