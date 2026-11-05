"""ARARA refined classifier head (paper Sec. III-B): 1024 -> Dense(512, ReLU) -> Dense(8, softmax).

The 8 outputs of esc50_forest_Demo.h5 correspond to the 8 ESC-50 categories trained in ARARA:
  [0: chainsaw, 1: rain, 2: engine, 3: hand_saw,
   4: chirping_birds, 5: thunderstorm, 6: wind, 7: insects]
Collapsing to the 4 reported classes of the paper (Table I / Fig. 2):
  0: chainsaw   -> p8[0]
  1: engine     -> p8[2]
  2: hand_saw   -> p8[3]
  3: others     -> p8[1] + p8[4] + p8[5] + p8[6] + p8[7]
"""

import numpy as np
import h5py

from . import HEAD_H5

CLASS_NAMES = ["chainsaw", "engine", "hand_saw", "others"]
NUM_CLASSES_RAW = 8
NUM_CLASSES = 4
OTHERS_INDICES = (1, 4, 5, 6, 7)


def softmax(z, axis=-1):
    z = z - z.max(axis=axis, keepdims=True)
    e = np.exp(z)
    return e / e.sum(axis=axis, keepdims=True)


def map_8_to_4(p8):
    p8 = np.asarray(p8)
    others = (p8[..., 1] + p8[..., 4] + p8[..., 5] + p8[..., 6] + p8[..., 7])
    return np.stack([p8[..., 0], p8[..., 2], p8[..., 3], others], axis=-1)


class Head:
    def __init__(self, h5_path=HEAD_H5):
        with h5py.File(h5_path, "r") as f:
            self.w1 = np.array(f["model_weights/dense_2/my_model/dense_2/kernel"], dtype=np.float32)  # (1024,512)
            self.b1 = np.array(f["model_weights/dense_2/my_model/dense_2/bias"], dtype=np.float32)
            self.w2 = np.array(f["model_weights/dense_3/my_model/dense_3/kernel"], dtype=np.float32)  # (512,8)
            self.b2 = np.array(f["model_weights/dense_3/my_model/dense_3/bias"], dtype=np.float32)

    def hidden(self, emb):
        return np.maximum(emb @ self.w1 + self.b1, 0.0)

    def logits(self, emb):
        return self.hidden(emb) @ self.w2 + self.b2

    def probs8(self, emb):
        return softmax(self.logits(emb))

    def probs4(self, emb):
        return map_8_to_4(self.probs8(emb))

