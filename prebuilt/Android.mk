LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
    LOCAL_MODULE := miui_prebuilt
    LOCAL_MODULE_TAGS := optional
    LOCAL_MODULE_CLASS := ETC
    LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)
    LOCAL_HOST_REQUIRED_MODULES := depmod
    LOCAL_POST_INSTALL_CMD += \
        mkdir -p $(TARGET_RECOVERY_ROOT_OUT)/vendor; \
        cp -rf $(LOCAL_PATH)/$(PRODUCT_RELEASE_NAME)/vendor $(TARGET_RECOVERY_ROOT_OUT)/; \
        cp -rf $(LOCAL_PATH)/$(PRODUCT_RELEASE_NAME)/system $(TARGET_RECOVERY_ROOT_OUT)/ > /dev/null 2>&1; \
        cp -rf $(LOCAL_PATH)/modules.blocklist $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib/modules/1.1/; \
        echo "calling depmod on miui_prebuilt"; \
        $(DEPMOD) -b $(TARGET_RECOVERY_ROOT_OUT)/vendor 1.1;
include $(BUILD_PHONY_PACKAGE)
