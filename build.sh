#!/bin/bash

rm -rf .repo/local_manifests/

# Rom source repo
repo init -u https://github.com/LineageOS/android -b lineage-21.0 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Clone local_manifests repository
git clone https://github.com/Assunzain/local_manifest -b crdroid14 .repo/local_manifests
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
lunch lineage_X01AD-ap2a-userdebug
echo "============="
m bacon -j16
