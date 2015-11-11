# Configuration for Linux on ARM.
# Generating binaries for the ARMv7-a architecture and higher with NEON
#
ARCH_ARM_HAVE_ARMV7A            := true
ARCH_ARM_HAVE_VFP               := true
ARCH_ARM_HAVE_VFP_D32           := true
ARCH_ARM_HAVE_NEON              := true

<<<<<<< HEAD
ifneq (,$(filter cortex-a15 denver krait,$(TARGET_$(combo_2nd_arch_prefix)CPU_VARIANT)))
	arch_variant_cflags := -mcpu=cortex-a15 -mfpu=neon-vfpv4
=======
ifneq (,$(filter cortex-a15 krait denver,$(TARGET_$(combo_2nd_arch_prefix)CPU_VARIANT)))
	# TODO: krait is not a cortex-a15, we set the variant to cortex-a15 so that
	#       hardware divide operations are generated. This should be removed and a
	#       krait CPU variant added to GCC. For clang we specify -mcpu for krait in
	#       core/clang/arm.mk.
	arch_variant_cflags := -mcpu=cortex-a15
>>>>>>> 71cd45a4fbee7eb650a523e4ad3c6eac4ef3ee58

	# Fake an ARM compiler flag as these processors support LPAE which GCC/clang
	# don't advertise.
	arch_variant_cflags += -D__ARM_FEATURE_LPAE=1
	arch_variant_ldflags := \
		-Wl,--no-fix-cortex-a8
else
ifeq ($(strip $(TARGET_$(combo_2nd_arch_prefix)CPU_VARIANT)),cortex-a9)
<<<<<<< HEAD
	arch_variant_cflags := -mcpu=cortex-a9 -mfpu=neon
	arch_variant_ldflags := \
		-Wl,--no-fix-cortex-a8
else
ifneq (,$(filter cortex-a8 scorpion,$(TARGET_$(combo_2nd_arch_prefix)CPU_VARIANT)))
	arch_variant_cflags := -mcpu=cortex-a8 -mfpu=neon
=======
	arch_variant_cflags := -mcpu=cortex-a9
else
ifneq (,$(filter cortex-a8 scorpion,$(TARGET_$(combo_2nd_arch_prefix)CPU_VARIANT)))
	arch_variant_cflags := -mcpu=cortex-a8
>>>>>>> 71cd45a4fbee7eb650a523e4ad3c6eac4ef3ee58
	arch_variant_ldflags := \
		-Wl,--fix-cortex-a8
else
ifeq ($(strip $(TARGET_$(combo_2nd_arch_prefix)CPU_VARIANT)),cortex-a7)
<<<<<<< HEAD
	arch_variant_cflags := -mcpu=cortex-a7 -mfpu=neon-vfpv4
	arch_variant_ldflags := \
		-Wl,--no-fix-cortex-a8
else
ifeq ($(strip $(TARGET_$(combo_2nd_arch_prefix)CPU_VARIANT)),cortex-a5)
	arch_variant_cflags := -mcpu=cortex-a7 -mfpu=neon-vfpv4
	arch_variant_ldflags := \
		-Wl,--no-fix-cortex-a8
else
	arch_variant_cflags := -march=armv7-a -mfpu=neon
=======
	arch_variant_cflags := -mcpu=cortex-a7
	arch_variant_ldflags := \
		-Wl,--no-fix-cortex-a8
else
	arch_variant_cflags := -march=armv7-a
>>>>>>> 71cd45a4fbee7eb650a523e4ad3c6eac4ef3ee58
	# Generic ARM might be a Cortex A8 -- better safe than sorry
	arch_variant_ldflags := \
		-Wl,--fix-cortex-a8
endif
<<<<<<< HEAD
endif
=======
>>>>>>> 71cd45a4fbee7eb650a523e4ad3c6eac4ef3ee58
endif
endif
endif

arch_variant_cflags += \
<<<<<<< HEAD
    -mfloat-abi=softfp
=======
    -mfloat-abi=softfp \
    -mfpu=neon
>>>>>>> 71cd45a4fbee7eb650a523e4ad3c6eac4ef3ee58
