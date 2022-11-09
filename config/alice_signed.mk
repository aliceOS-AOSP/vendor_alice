OFFICIAL_MAINTAINER = $(shell cat official-maintainer/maintainers.list | awk '{ print $$1 }')

ifdef ALICE_MAINTAINER
ifeq ($(filter $(ALICE_MAINTAINER), $(OFFICIAL_MAINTAINER)), $(ALICE_MAINTAINER))
$(warning "alice: $(ALICE_MAINTAINER) is verified as official maintainer, build as official build.")
    ALICE_OFFICIAL = true
    include official-settings/sign.mk
else
$(warning "alice: Unofficial maintainer detected, building as unofficial build.")
endif
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
   ro.alice.maintainer=$(ALICE_MAINTAINER)
else
$(warning "alice: No maintainer name detected, building as unofficial build.")
endif
