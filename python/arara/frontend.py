"""YAMNet audio frontend: waveform -> log-mel patches.

Mirrors tensorflow/models/research/audioset/yamnet/features.py (non-TFLite path):
  * 16 kHz mono, STFT with a periodic Hann window of 400 samples, hop 160, FFT 512
  * magnitude spectrogram, HTK mel matrix (64 bands, 125-7500 Hz, DC bin zeroed)
  * log(mel + 0.001)
  * patches of 96 frames (0.96 s) with a hop of 48 frames (0.48 s)
The bare-metal C implementation (software/frontend.c) follows the same maths in float32.
"""

import numpy as np

SAMPLE_RATE = 16000
WIN = 400                 # 25 ms
HOP = 160                 # 10 ms
NFFT = 512
NBINS = NFFT // 2 + 1     # 257
N_MEL = 64
MEL_MIN_HZ = 125.0
MEL_MAX_HZ = 7500.0
LOG_OFFSET = 0.001
PATCH_FRAMES = 96
PATCH_HOP_FRAMES = 48
PATCH_SAMPLES = (PATCH_FRAMES - 1) * HOP + WIN           # 15600 samples needed per patch
PATCH_HOP_SAMPLES = PATCH_HOP_FRAMES * HOP               # 7680 samples (0.48 s)


def hann_periodic(n=WIN):
    k = np.arange(n, dtype=np.float64)
    return (0.5 - 0.5 * np.cos(2.0 * np.pi * k / n)).astype(np.float32)


def _hz_to_mel(f):
    return 1127.0 * np.log(1.0 + f / 700.0)


def mel_matrix():
    """tf.signal.linear_to_mel_weight_matrix(64, 257, 16000, 125, 7500) -> (257, 64) float32."""
    nyquist = SAMPLE_RATE / 2.0
    lin = np.linspace(0.0, nyquist, NBINS)[1:]
    bins_mel = _hz_to_mel(lin)[:, None]
    edges = np.linspace(_hz_to_mel(MEL_MIN_HZ), _hz_to_mel(MEL_MAX_HZ), N_MEL + 2)
    lower, center, upper = edges[:-2][None, :], edges[1:-1][None, :], edges[2:][None, :]
    lower_slopes = (bins_mel - lower) / (center - lower)
    upper_slopes = (upper - bins_mel) / (upper - center)
    w = np.maximum(0.0, np.minimum(lower_slopes, upper_slopes))
    w = np.pad(w, ((1, 0), (0, 0)))
    return w.astype(np.float32)


_WINDOW = hann_periodic()
_MEL = mel_matrix()


def pad_waveform(x):
    """features.pad_waveform(): zero-pad so an integral number of patches is produced."""
    x = np.asarray(x, dtype=np.float32)
    min_samples = int((PATCH_FRAMES * HOP / SAMPLE_RATE * SAMPLE_RATE) + (WIN - HOP))  # 15600
    n = len(x)
    pad = max(0, min_samples - n)
    n = max(n, min_samples)
    after_first = n - min_samples
    hops = int(np.ceil(after_first / PATCH_HOP_SAMPLES))
    pad += PATCH_HOP_SAMPLES * hops - after_first
    return np.pad(x, (0, pad))


def log_mel(x):
    """(N,) float32 waveform -> (frames, 64) float32 log-mel spectrogram (no padding added)."""
    x = np.asarray(x, dtype=np.float32)
    nfr = 1 + (len(x) - WIN) // HOP
    idx = np.arange(WIN)[None, :] + HOP * np.arange(nfr)[:, None]
    frames = x[idx] * _WINDOW[None, :]
    spec = np.abs(np.fft.rfft(frames, n=NFFT, axis=1)).astype(np.float32)
    mel = spec @ _MEL
    return np.log(mel + np.float32(LOG_OFFSET)).astype(np.float32)


def log_mel_patch(samples15600):
    """One 15600-sample window -> (96, 64) log-mel patch."""
    s = np.asarray(samples15600, dtype=np.float32)
    assert len(s) == PATCH_SAMPLES
    return log_mel(s)


def waveform_to_patches(x):
    """Full YAMNet framing: pad + log-mel + 96-frame patches with 48-frame hop -> (P, 96, 64)."""
    xp = pad_waveform(x)
    lm = log_mel(xp)
    n = 1 + (len(lm) - PATCH_FRAMES) // PATCH_HOP_FRAMES
    idx = np.arange(PATCH_FRAMES)[None, :] + PATCH_HOP_FRAMES * np.arange(n)[:, None]
    return lm[idx]


def patch_sample_offsets(num_samples):
    """Start sample (in the original waveform) of each patch produced by waveform_to_patches."""
    xp_len = len(pad_waveform(np.zeros(num_samples, dtype=np.float32)))
    nfr = 1 + (xp_len - WIN) // HOP
    n = 1 + (nfr - PATCH_FRAMES) // PATCH_HOP_FRAMES
    return [i * PATCH_HOP_SAMPLES for i in range(n)]

