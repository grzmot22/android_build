# Target-specific configuration

# Populate the qcom hardware variants in the project pathmap.
<<<<<<< HEAD
define ril-set-path-variant
$(call project-set-path-variant,ril,TARGET_RIL_VARIANT,hardware/$(1))
endef

# Set device-specific HALs into project pathmap
define set-device-specific-path
$(call project-set-path,qcom-$(2),$(strip $(if $(USE_DEVICE_SPECIFIC_$(1)), \
    $(TARGET_DEVICE_DIR)/$(2), $(3))))
=======
define qcom-set-path-variant
$(call project-set-path-variant,qcom-$(2),TARGET_QCOM_$(1)_VARIANT,hardware/qcom/$(2))
endef
define ril-set-path-variant
$(call project-set-path-variant,ril,TARGET_RIL_VARIANT,hardware/$(1))
endef
define wlan-set-path-variant
$(call project-set-path-variant,wlan,TARGET_WLAN_VARIANT,hardware/qcom/$(1))
endef
define bt-vendor-set-path-variant
$(call project-set-path-variant,bt-vendor,TARGET_BT_VENDOR_VARIANT,hardware/qcom/$(1))
endef
define gps-hal-set-path-variant
$(call project-set-path-variant,gps-hal,TARGET_GPS_HAL_PATH,$(1))
endef
define loc-api-set-path-variant
$(call project-set-path-variant,loc-api,TARGET_LOC_API_PATH,$(1))
>>>>>>> 71cd45a4fbee7eb650a523e4ad3c6eac4ef3ee58
endef

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)

    qcom_flags := -DQCOM_HARDWARE
    qcom_flags += -DQCOM_BSP
<<<<<<< HEAD
=======
    qcom_flags += -DQTI_BSP
>>>>>>> 71cd45a4fbee7eb650a523e4ad3c6eac4ef3ee58

    TARGET_USES_QCOM_BSP := true
    TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

<<<<<<< HEAD
    # Enable DirectTrack for legacy targets
    ifneq ($(filter msm7x30 msm8660 msm8960,$(TARGET_BOARD_PLATFORM)),)
        ifeq ($(BOARD_USES_LEGACY_ALSA_AUDIO),true)
            qcom_flags += -DQCOM_DIRECTTRACK
        endif
=======
    # Tell HALs that we're compiling an AOSP build with an in-line kernel
    TARGET_COMPILE_WITH_MSM_KERNEL := true

    ifneq ($(filter msm7x30 msm8660 msm8960,$(TARGET_BOARD_PLATFORM)),)
>>>>>>> 71cd45a4fbee7eb650a523e4ad3c6eac4ef3ee58
        # Enable legacy graphics functions
        qcom_flags += -DQCOM_BSP_LEGACY
    endif

<<<<<<< HEAD
    # Enable extra offloading for post-805 targets
    ifneq ($(filter msm8992 msm8994,$(TARGET_BOARD_PLATFORM)),)
        qcom_flags += -DHAS_EXTRA_FLAC_METADATA
    endif

=======
>>>>>>> 71cd45a4fbee7eb650a523e4ad3c6eac4ef3ee58
    TARGET_GLOBAL_CFLAGS += $(qcom_flags)
    TARGET_GLOBAL_CPPFLAGS += $(qcom_flags)
    CLANG_TARGET_GLOBAL_CFLAGS += $(qcom_flags)
    CLANG_TARGET_GLOBAL_CPPFLAGS += $(qcom_flags)

    # Multiarch needs these too..
    2ND_TARGET_GLOBAL_CFLAGS += $(qcom_flags)
    2ND_TARGET_GLOBAL_CPPFLAGS += $(qcom_flags)
    2ND_CLANG_TARGET_GLOBAL_CFLAGS += $(qcom_flags)
    2ND_CLANG_TARGET_GLOBAL_CPPFLAGS += $(qcom_flags)

    ifeq ($(QCOM_HARDWARE_VARIANT),)
        ifneq ($(filter msm8610 msm8226 msm8974,$(TARGET_BOARD_PLATFORM)),)
            QCOM_HARDWARE_VARIANT := msm8974
        else
        ifneq ($(filter msm8909 msm8916,$(TARGET_BOARD_PLATFORM)),)
            QCOM_HARDWARE_VARIANT := msm8916
        else
        ifneq ($(filter msm8992 msm8994,$(TARGET_BOARD_PLATFORM)),)
            QCOM_HARDWARE_VARIANT := msm8994
        else
            QCOM_HARDWARE_VARIANT := $(TARGET_BOARD_PLATFORM)
        endif
        endif
        endif
    endif

$(call project-set-path,qcom-audio,hardware/qcom/audio-caf/$(QCOM_HARDWARE_VARIANT))
<<<<<<< HEAD
$(call set-device-specific-path,CAMERA,camera,hardware/qcom/camera)
$(call project-set-path,qcom-display,hardware/qcom/display-caf/$(QCOM_HARDWARE_VARIANT))
$(call set-device-specific-path,GPS,gps,hardware/qcom/gps)
$(call project-set-path,qcom-media,hardware/qcom/media-caf/$(QCOM_HARDWARE_VARIANT))
$(call set-device-specific-path,SENSORS,sensors,hardware/qcom/sensors)
$(call ril-set-path-variant,ril)
$(call set-device-specific-path,LOC_API,loc-api,vendor/qcom/opensource/location)
else
$(call project-set-path,qcom-audio,hardware/qcom/audio/default)
$(call project-set-path,qcom-camera,hardware/qcom/camera)
$(call project-set-path,qcom-display,hardware/qcom/display/$(TARGET_BOARD_PLATFORM))
$(call project-set-path,qcom-gps,hardware/qcom/gps)
$(call project-set-path,qcom-media,hardware/qcom/media/default)
$(call project-set-path,qcom-sensors,hardware/qcom/sensors)
$(call ril-set-path-variant,ril)
$(call project-set-path,loc-api,vendor/qcom/opensource/location)
=======
ifeq ($(USE_DEVICE_SPECIFIC_CAMERA),true)
$(call project-set-path,qcom-camera,$(TARGET_DEVICE_DIR)/camera)
else
$(call qcom-set-path-variant,CAMERA,camera)
endif
$(call project-set-path,qcom-display,hardware/qcom/display-caf/$(QCOM_HARDWARE_VARIANT))
$(call qcom-set-path-variant,GPS,gps)
$(call project-set-path,qcom-media,hardware/qcom/media-caf/$(QCOM_HARDWARE_VARIANT))
$(call qcom-set-path-variant,SENSORS,sensors)
$(call ril-set-path-variant,ril)
$(call wlan-set-path-variant,wlan-caf)
$(call bt-vendor-set-path-variant,bt-caf)
$(call loc-api-set-path-variant,vendor/qcom/opensource/location)
$(call gps-hal-set-path-variant,hardware/qcom/gps)
else
$(call project-set-path,qcom-audio,hardware/qcom/audio/default)
$(call qcom-set-path-variant,CAMERA,camera)
$(call project-set-path,qcom-display,hardware/qcom/display/$(TARGET_BOARD_PLATFORM))
$(call qcom-set-path-variant,GPS,gps)
$(call project-set-path,qcom-media,hardware/qcom/media/default)
$(call qcom-set-path-variant,SENSORS,sensors)
$(call ril-set-path-variant,ril)
$(call wlan-set-path-variant,wlan)
$(call bt-vendor-set-path-variant,bt)
$(call loc-api-set-path-variant,vendor/qcom/opensource/location)
$(call gps-hal-set-path-variant,hardware/qcom/gps)
>>>>>>> 71cd45a4fbee7eb650a523e4ad3c6eac4ef3ee58
endif
