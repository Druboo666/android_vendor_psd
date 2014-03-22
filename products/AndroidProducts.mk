# Copyright (C) 2013 ParanoidAndroid Project
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

ifeq (psd_deb,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/psd_deb.mk
endif
ifeq (psd_flo,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/psd_flo.mk
endif
ifeq (psd_grouper,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/psd_grouper.mk
endif
ifeq (psd_hammerhead,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/psd_hammerhead.mk
endif
ifeq (psd_maguro,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/psd_maguro.mk
endif
ifeq (psd_mako,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/psd_mako.mk
endif
ifeq (psd_manta,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/psd_manta.mk
endif
ifeq (psd_tilapia,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/psd_tilapia.mk
endif
ifeq (psd_toro,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/psd_toro.mk
endif
ifeq (psd_toroplus,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/psd_toroplus.mk
endif
