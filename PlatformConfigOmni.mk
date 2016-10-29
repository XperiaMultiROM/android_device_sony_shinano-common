# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Common
include device/sony/shinano-common/PlatformConfig.mk

# Bootdevice 
BOARD_KERNEL_CMDLINE += androidboot.bootdevice=msm_sdcc.1

# kernel
TARGET_KERNEL_SOURCE := kernel/sony/msm

#MultiROM config. MultiROM also uses parts of TWRP config
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/sony/shinano-common/multirom/mr_init_devices.c
MR_BINARY_SELECTOR := device/sony/shinano-common/multirom/mr_binary_selector.c
MR_USE_QCOM_OVERLAY := true
MR_QCOM_OVERLAY_HEADER := device/sony/shinano-common/multirom/mr_qcom_overlay.h
MR_KEXEC_DTB := true
MR_ALLOW_NKK71_NOKEXEC_WORKAROUND := true
MR_FSTAB := device/sony/shinano-common/rootdir/twrp.fstab
MR_USE_MROM_FSTAB := true
MR_QCOM_OVERLAY_CUSTOM_PIXEL_FORMAT := MDP_RGBX_8888
MR_PIXEL_FORMAT := "RGBX_8888"
MR_KEXEC_MEM_MIN := 0x3e7e0000
MR_DEVICE_HOOKS := device/sony/shinano-common/multirom/mr_ric_hook.c
MR_DEVICE_HOOKS_VER := 3

# Ensure gzip compression for recovery
BOARD_NEEDS_LZMA_MINIGZIP := false
