# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
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

# -----------------------------------------------------------------
# Lineage OTA update package

LINEAGE_TARGET_PACKAGE := $(PRODUCT_OUT)/$(LINEAGE_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) mv -f $(INTERNAL_OTA_PACKAGE_TARGET) $(LINEAGE_TARGET_PACKAGE)
	$(hide) $(SHA256) $(LINEAGE_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(LINEAGE_TARGET_PACKAGE).sha256sum
	$(hide) rm -rf $(call intermediates-dir-for,PACKAGING,target_files)
	echo -e "#######################################################################################";
	echo -e " __          __    _                                _                                  ";
	echo -e " \ \        / /   | |                              | |                                 ";
	echo -e "  \ \  /\  / /___ | |  ___  ___   _ __ ___    ___  | |_  ___                           ";
	echo -e "   \ \/  \/ // _ \| | / __|/ _ \ | '_ \` _ \  / _ \ | __|/ _ \                         ";
	echo -e "    \  /\  /|  __/| || (__| (_) || | | | | ||  __/ | |_| (_) |                         ";
	echo -e "     \/  \/  \___||_| \___|\___/ |_| |_| |_| \___|  \__|\___/                          ";
	echo -e "                  _      _  _                      _  _      _______                   ";
	echo -e "     /\          | |    (_)| |                    (_)| |    |__   __|                  ";
	echo -e "    /  \    _ __ | |__   _ | |_  _ __  __ _  _ __  _ | | _   _ | |  ___   _ __    __ _ ";
	echo -e "   / /\ \  | '__|| '_ \ | || __|| '__|/ _\` || '__|| || || | | || | / _ \ | '_ \  / _\|";
	echo -e "  / ____ \ | |   | |_) || || |_ | |  | (_| || |   | || || |_| || || (_) || | | || (_| |";
	echo -e " /_/    \_\|_|   |_.__/ |_| \__||_|   \__,_||_|   |_||_| \__, ||_| \___/ |_| |_| \__, |";
	echo -e "                                                          __/ |                   __/ |";
	echo -e "                                                         |___/                   |___/ ";
	echo -e "#######################################################################################";
	@echo "Package Complete: $(LINEAGE_TARGET_PACKAGE)" >&2