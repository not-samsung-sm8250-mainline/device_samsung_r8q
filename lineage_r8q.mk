# Copyright (C) 2026 The (not) Organization

# Inherit from common-r8q
$(call inherit-product, device/samsung/r8q/common-r8q.mk)

# Debug bringup
WITH_ADB_INSECURE := true
