#!/bin/bash

rm -rf .repo/local_manifests/

# Rom source repo
repo init -u https://github.com/DerpFest-AOSP/manifest -b 13 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Clone local_manifests repository
git clone https://github.com/Assunzain/local_manifest -b Derp .repo/local_manifests
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
lunch derp_X01AD-userdebug
echo "============="
mka derp -j16
