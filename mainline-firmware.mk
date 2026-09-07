# SPDX-License-Identifier: Apache-2.0
#
# Signed r8q PIL firmware extracted from Samsung G780GXXSHEYJ1 NON-HLOS.
# Keep the split .bXX segments beside the .mbn headers: qcom_mdt_load()
# requests each segment by replacing the last three characters of the header.

ifeq ($(TARGET_MAINLINE_R8Q_BRINGUP),true)

R8Q_MAINLINE_FIRMWARE_ROOT := vendor/samsung/r8q/proprietary/vendor/firmware
R8Q_MAINLINE_FIRMWARE_FILES := $(wildcard \
    $(R8Q_MAINLINE_FIRMWARE_ROOT)/qcom/sm8250/a650_zap.* \
    $(R8Q_MAINLINE_FIRMWARE_ROOT)/qcom/sm8250/Samsung/r8q/adsp.* \
    $(R8Q_MAINLINE_FIRMWARE_ROOT)/qcom/sm8250/Samsung/r8q/cdsp.* \
    $(R8Q_MAINLINE_FIRMWARE_ROOT)/qcom/sm8250/Samsung/r8q/slpi.*)

PRODUCT_COPY_FILES += $(foreach file,$(R8Q_MAINLINE_FIRMWARE_FILES), \
    $(file):$(TARGET_COPY_OUT_VENDOR)/firmware/$(patsubst $(R8Q_MAINLINE_FIRMWARE_ROOT)/%,%,$(file)))

endif
