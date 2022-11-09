ifeq ($(ALICE_OFFICIAL),true)
ALICE_TARGET_PACKAGE := $(PRODUCT_OUT)/$(ALICE_REVISION)_SIGNED.zip
else
ALICE_TARGET_PACKAGE := $(PRODUCT_OUT)/$(ALICE_REVISION).zip
endif
MD5 := prebuilts/build-tools/path/$(HOST_OS)-x86/md5sum

.PHONY: alice
alice: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(ALICE_TARGET_PACKAGE)
	$(hide) $(MD5) $(ALICE_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(ALICE_TARGET_PACKAGE).md5sum
	$(hide) ./vendor/alice/tools/generate_json_build_info.sh $(ALICE_TARGET_PACKAGE)
	@echo "Done"
	@echo -e "\t ===============================-Package complete-========================================="
	@echo -e "\t Zip: $(ALICE_TARGET_PACKAGE)"
	@echo -e "\t Size: `du -sh $(ALICE_TARGET_PACKAGE) | awk '{print $$1}' `"
	@echo -e "\t =========================================================================================="
