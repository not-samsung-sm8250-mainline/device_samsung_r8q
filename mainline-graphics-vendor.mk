# SPDX-License-Identifier: Apache-2.0
#
# Mainline graphics vendor adjustments. This file is inherited after the
# generated common and device vendor makefiles so generated package lists stay
# untouched.

ifeq ($(TARGET_USES_MAINLINE_GRAPHICS),true)

MAINLINE_DOWNSTREAM_GRAPHICS_PACKAGES := \
    eglSubDriverAndroid \
    libEGL_adreno \
    libGLESv1_CM_adreno \
    libGLESv2_adreno \
    libq3dtools_adreno \
    libq3dtools_esx \
    vulkan.adreno \
    libC2D2 \
    libCB \
    libGPreqcancel \
    libGPreqcancel_svc \
    libadreno_utils \
    libc2d30_bltlib \
    libgpudataproducer \
    libgsl \
    libllvm-glnext \
    libllvm-qcom \
    libsdm-color \
    libsdm-colormgr-algo \
    libsdm-diag \
    libsdm-disp-vndapis \
    libsdmextension \
    unnhal-acc-adreno \
    vendor.display.color@1.0 \
    vendor.display.color@1.1 \
    vendor.display.color@1.2 \
    vendor.display.color@1.3 \
    vendor.display.color@1.4 \
    vendor.display.color@1.5 \
    vendor.display.postproc@1.0 \
    vendor.display.color@1.0-service \
    qdcmss \
    vendor_lib_libEGL_adreno_so \
    vendor_lib_libGLESv2_adreno_so \
    vendor_lib_libq3dtools_adreno_so \
    vendor_lib64_libEGL_adreno_so \
    vendor_lib64_libGLESv2_adreno_so \
    vendor_lib64_libq3dtools_adreno_so

PRODUCT_PACKAGES := $(filter-out $(MAINLINE_DOWNSTREAM_GRAPHICS_PACKAGES),$(PRODUCT_PACKAGES))

MAINLINE_DOWNSTREAM_GRAPHICS_COPY_FILES := \
    vendor/samsung/sm8250-common/proprietary/vendor/etc/init/qdcmss.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/qdcmss.rc \
    vendor/samsung/sm8250-common/proprietary/vendor/etc/init/vendor.display.color@1.0-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/vendor.display.color@1.0-service.rc

PRODUCT_COPY_FILES := $(filter-out $(MAINLINE_DOWNSTREAM_GRAPHICS_COPY_FILES),$(PRODUCT_COPY_FILES))

# The MSM DRM driver requests these files below the qcom firmware directory.
PRODUCT_COPY_FILES += \
    vendor/samsung/sm8250-common/proprietary/vendor/firmware/a650_gmu.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/a650_gmu.bin \
    vendor/samsung/sm8250-common/proprietary/vendor/firmware/a650_sqe.fw:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/a650_sqe.fw

# Add the signed ZAP firmware automatically once it is present in a vendor
# repository, without adding an unverified blob or a placeholder today.
MAINLINE_A650_ZAP_SOURCE := $(firstword $(wildcard \
    vendor/samsung/sm8250-common/proprietary/vendor/firmware/a650_zap.mbn \
    vendor/samsung/sm8250-common/proprietary/vendor/firmware/qcom/sm8250/a650_zap.mbn \
    vendor/samsung/r8q/proprietary/vendor/firmware/a650_zap.mbn \
    vendor/samsung/r8q/proprietary/vendor/firmware/qcom/sm8250/a650_zap.mbn))
ifneq ($(strip $(MAINLINE_A650_ZAP_SOURCE)),)
MAINLINE_A650_ZAP_COPY := $(MAINLINE_A650_ZAP_SOURCE):$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/sm8250/a650_zap.mbn
ifneq ($(filter $(MAINLINE_A650_ZAP_COPY),$(PRODUCT_COPY_FILES)),)
# The vendor generator already emitted this exact copy rule.
else
PRODUCT_COPY_FILES += \
    $(MAINLINE_A650_ZAP_COPY)
endif
endif

endif
