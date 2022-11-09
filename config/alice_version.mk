ALICE_HOST_TIME := $(shell date +"%Y%m%d-%H%M")
ALICE_BUILD_DATE := $(shell date -u +%d%m%Y)
ALICE_BUILD_TIME := $(shell date -u +%H%M)
ALICE_BUILD_DATE_TIME := $(ALICE_BUILD_DATE)$(ALICE_BUILD_TIME)
ALICE_GENID := $(shell date -u +%M%d%m)

ifndef ALICE_BUILD_TYPE
   ALICE_BUILD_TYPE := REL
endif

ALICE_VERSION := r9
ALICE_ANDROID := 13.0
ALICE_PLATFORM_RELEASE_OR_CODENAME := 13.0
ALICE_REVISION := ALICE.$(ALICE_ANDROID).$(ALICE_VERSION)-$(ALICE_GENID)-$(ALICE_BUILD).$(ALICE_BUILD_TYPE)
ALICE_BUILD_NUMBER := alice.$(ALICE_VERSION).$(ALICE_HOST_TIME)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
   ro.aosp.revision=$(AOSP_REVISION) \
   ro.alice.platform_release_or_codename=$(ALICE_PLATFORM_RELEASE_OR_CODENAME) \
   ro.alice.revision=$(ALICE_REVISION) \
   ro.alice.build.security_patch=$(ALICE_SECURITY_PATCH) \
   ro.alice.build.number=$(ALICE_BUILD_NUMBER) \
   ro.build.datetime=$(ALICE_BUILD_DATE_TIME)
