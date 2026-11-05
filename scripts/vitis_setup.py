#!/usr/bin/env python3
"""
Vitis Unified Automation Script (AMD Vitis 2023.2+ / 2026.1)
Creates a Bare-Metal Platform and ARARA Acoustic Deforestation Application from zynq_ml.xsa.
Usage:
  vitis -s scripts/vitis_setup.py
"""

import os
import shutil
import sys

try:
    import vitis
except ImportError:
    print("[!] This script must be executed with Vitis: vitis -s scripts/vitis_setup.py")
    sys.exit(1)

PROJECT_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
WORKSPACE = os.path.join(PROJECT_DIR, "vitis_workspace")
XSA_PATH = os.path.join(PROJECT_DIR, "zynq_ml.xsa")
SW_DIR = os.path.join(PROJECT_DIR, "software")
SRC_DIR = os.path.join(WORKSPACE, "src")

APP_SOURCES = [
    "main.c",
    "uart.h", "uart.c",
    "peripherals.h", "peripherals.c",
    "frontend.h", "frontend.c",
    "cnn_neon.h", "cnn_neon.c",
    "cnn_int8.h", "cnn_int8.c",
    "model_weights.h", "model_weights.c",
    "model_blob.s",
]

os.makedirs(SRC_DIR, exist_ok=True)
for fname in APP_SOURCES:
    src_file = os.path.join(SW_DIR, fname)
    if os.path.exists(src_file):
        shutil.copy2(src_file, os.path.join(SRC_DIR, fname))

client = vitis.create_client()
client.set_workspace(WORKSPACE)
print(f"[*] Vitis Workspace set to: {WORKSPACE}")

if not os.path.exists(XSA_PATH):
    print(f"[!] Warning: {XSA_PATH} not found. Run 'make vivado-bitstream' first to generate XSA.")
    sys.exit(0)

platform_name = "arara_zybo_z7_10_platform"
print(f"[*] Creating Platform Component '{platform_name}' from {XSA_PATH}...")
try:
    platform = client.create_platform_component(
        name=platform_name,
        hw_design=XSA_PATH,
        os="standalone",
        cpu="ps7_cortexa9_0",
        domain_name="standalone_ps7_cortexa9_0",
    )
    platform.build()
    print("[+] Platform built successfully!")
except Exception as e:
    print(f"[!] Platform creation note: {e}")

app_name = "arara_deforestation_app"
print(f"[*] Creating Application Component '{app_name}'...")
try:
    xpfm = os.path.join(WORKSPACE, platform_name, "export", platform_name, f"{platform_name}.xpfm")
    app = client.create_app_component(
        name=app_name,
        platform=xpfm,
        domain="standalone_ps7_cortexa9_0",
        template="empty_application",
    )
    for fname in APP_SOURCES:
        fpath = os.path.join(SRC_DIR, fname)
        if os.path.isfile(fpath):
            app.import_files(from_loc=fpath, dest_dir_in_cmp="src")
    app.set_app_config(key="USER_COMPILE_OTHER_FLAGS",
                       values=f"-mcpu=cortex-a9 -mfpu=neon -mfloat-abi=hard -O2 -Wa,-I{PROJECT_DIR}")
    app.set_app_config(key="USER_LINK_LIBRARIES", values="m")
    app.build()
    print("[+] Application built successfully!")
except Exception as e:
    print(f"[!] Application creation note: {e}")

vitis.dispose()
print("[*] Vitis setup complete!")
