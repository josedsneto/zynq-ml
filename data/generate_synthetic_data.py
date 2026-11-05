#!/usr/bin/env python3
"""
Generate synthetic test dataset for Zynq-7000 SoC CNN benchmark.
Creates 16x16 grayscale synthetic digit images with noise and variation,
and formats them for UART streaming.

Outputs:
  - data/dataset.json
  - data/dataset_int8.txt
  - data/dataset_neon.txt
  - data/dataset_both.txt
"""

import os
import json
import numpy as np

IMG_SIZE = 16
NUM_CLASSES = 10

def draw_digit(digit, noise_level=0.0):
    img = np.zeros((IMG_SIZE, IMG_SIZE), dtype=np.float32)
    r0, r1 = 3, 12
    c0, c1 = 3, 12
    mid_r = (r0 + r1) // 2
    mid_c = (c0 + c1) // 2

    if digit == 0:
        img[r0:r1+1, c0] = 1.0
        img[r0:r1+1, c1] = 1.0
        img[r0, c0:c1+1] = 1.0
        img[r1, c0:c1+1] = 1.0
    elif digit == 1:
        img[r0:r1+1, mid_c] = 1.0
        img[r0+1, mid_c-1] = 1.0
        img[r1, mid_c-2:mid_c+3] = 1.0
    elif digit == 2:
        img[r0, c0:c1+1] = 1.0
        img[r0:mid_r+1, c1] = 1.0
        img[mid_r, c0:c1+1] = 1.0
        img[mid_r:r1+1, c0] = 1.0
        img[r1, c0:c1+1] = 1.0
    elif digit == 3:
        img[r0, c0:c1+1] = 1.0
        img[mid_r, c0:c1+1] = 1.0
        img[r1, c0:c1+1] = 1.0
        img[r0:r1+1, c1] = 1.0
    elif digit == 4:
        img[r0:mid_r+1, c0] = 1.0
        img[mid_r, c0:c1+1] = 1.0
        img[r0:r1+1, c1] = 1.0
    elif digit == 5:
        img[r0, c0:c1+1] = 1.0
        img[r0:mid_r+1, c0] = 1.0
        img[mid_r, c0:c1+1] = 1.0
        img[mid_r:r1+1, c1] = 1.0
        img[r1, c0:c1+1] = 1.0
    elif digit == 6:
        img[r0:r1+1, c0] = 1.0
        img[r0, c0:c1+1] = 1.0
        img[mid_r, c0:c1+1] = 1.0
        img[r1, c0:c1+1] = 1.0
        img[mid_r:r1+1, c1] = 1.0
    elif digit == 7:
        img[r0, c0:c1+1] = 1.0
        for i, r in enumerate(range(r0+1, r1+1)):
            c = c1 - i
            if c >= c0:
                img[r, c] = 1.0
    elif digit == 8:
        img[r0:r1+1, c0] = 1.0
        img[r0:r1+1, c1] = 1.0
        img[r0, c0:c1+1] = 1.0
        img[mid_r, c0:c1+1] = 1.0
        img[r1, c0:c1+1] = 1.0
    elif digit == 9:
        img[r0:mid_r+1, c0] = 1.0
        img[r0:r1+1, c1] = 1.0
        img[r0, c0:c1+1] = 1.0
        img[mid_r, c0:c1+1] = 1.0
        img[r1, c0:c1+1] = 1.0

    if noise_level > 0.0:
        noise = np.random.uniform(-noise_level, noise_level, img.shape)
        img = np.clip(img + noise, 0.0, 1.0)

    return img

def generate_synthetic_data(data_dir=None):
    if data_dir is None:
        data_dir = os.path.dirname(os.path.abspath(__file__))

    os.makedirs(data_dir, exist_ok=True)
    np.random.seed(42)

    print(f"[*] Generating synthetic digit dataset in {data_dir}...")
    samples = []
    for digit in range(NUM_CLASSES):
        for variation in range(2):
            sample_id = digit * 2 + variation
            noise = 0.05 if variation == 0 else 0.12
            img = draw_digit(digit, noise_level=noise)
            if variation == 1:
                shift = ((-1 if digit % 2 == 0 else 1), 0)
                img = np.roll(img, shift, axis=(0, 1))

            pixels_uint8 = np.clip(np.round(img * 255.0), 0, 255).astype(np.uint8).flatten()
            hex_data = "".join(f"{b:02x}" for b in pixels_uint8)

            samples.append({
                'id': sample_id,
                'label': digit,
                'pixels_uint8': pixels_uint8.tolist(),
                'hex_data': hex_data
            })

    # Save dataset.json
    json_path = os.path.join(data_dir, "dataset.json")
    with open(json_path, 'w') as f:
        json.dump(samples, f, indent=2)

    # Save dataset_int8.txt
    int8_path = os.path.join(data_dir, "dataset_int8.txt")
    with open(int8_path, 'w') as f:
        f.write("MODE INT8\n")
        for s in samples:
            f.write(f"SAMPLE {s['id']} {s['label']} {s['hex_data']}\n")
        f.write("REPORT\n")
        f.write("EXIT\n")

    # Save dataset_neon.txt
    neon_path = os.path.join(data_dir, "dataset_neon.txt")
    with open(neon_path, 'w') as f:
        f.write("MODE NEON\n")
        for s in samples:
            f.write(f"SAMPLE {s['id']} {s['label']} {s['hex_data']}\n")
        f.write("REPORT\n")
        f.write("EXIT\n")

    # Save dataset_both.txt
    both_path = os.path.join(data_dir, "dataset_both.txt")
    with open(both_path, 'w') as f:
        f.write("MODE BOTH\n")
        for s in samples:
            f.write(f"SAMPLE {s['id']} {s['label']} {s['hex_data']}\n")
        f.write("REPORT\n")
        f.write("EXIT\n")

    print(f"[+] Successfully generated {len(samples)} synthetic samples in {data_dir}/")
    return samples

if __name__ == '__main__':
    generate_synthetic_data()
