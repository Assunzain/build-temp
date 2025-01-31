rm -rf .repo/local_manifests/

# Rom source repo
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Clone local_manifests repository
git clone https://github.com/OkBuddyGSI/treble_manifest -b 14 .repo/local_manifests
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
make systemimage -j\$(nproc --all)
