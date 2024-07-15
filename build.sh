rm -rf .repo/local_manifests &&

repo init -u https://github.com/Assunzain/cobian.git -b main --git-lfs && 

git clone https://github.com/Assunzain/local_manifest -b af .repo/local_manifests && 


# Sync source rom 
/opt/crave/resync.sh && 

# Set up build environment 
export BUILD_USERNAME=Assunzain && 
export BUILD_HOSTNAME=crave && 
export TZ=Asia/Jakarta && 
. build/envsetup.sh && 
lunch afterlife_X01AD-userdebug && m afterlife -j16'
