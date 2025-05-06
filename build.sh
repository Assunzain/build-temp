#!/bin/bash

rm -rf .repo/local_manifests/

# Rom source repo
repo init -u https://github.com/ResurrectionRemix/platform_manifest.git -b Q

echo "=================="
echo "Repo init success"
echo "=================="

# Clone local_manifests repository
git clone https://github.com/Assunzain/local_manifest -b 10-rr .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync the repositories
/opt/crave/resync.sh
echo "============================"

# Export
export BUILD_USERNAME=Assunzain
export BUILD_HOSTNAME=crave
export TZ=Asia/Jakarta
echo "======= Export Done ======"

#build the rom
. build/envsetup.sh
echo "============="
m installclean
echo "============="
lunch rr_X01AD-userdebug
echo "============="
mka bacon -j16
