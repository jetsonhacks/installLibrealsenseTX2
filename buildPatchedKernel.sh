# Patch UVC RealSense camera format changes
# Mark the UVC Video driver to build as a module
# Patch the UVC Video Driver with the RealSense Camera Formats
echo ""
echo "This script will patch the UVC Video driver."
echo "The script expects that the kernel sources have been downloaded and built beforehand."
echo "The script expects the kernel sources to be in /usr/src/kernel/kernel-4.4"
echo ""
echo "The script patches the UVC Driver with the RealSense Camera formats,"
echo "modifies the kernel .config file, and then compiles the kernel and modules"
echo "Once finished, the script copies the kernel image to the boot directory."
echo "Use caution, as this script *WILL* replace your current kernel with whatever is in"
echo "/usr/src/kernel/kernel-4.4"
echo "Requires reboot after script completion"
echo ""
read -p "Patch UVCVideo Driver, Recompile Kernel and Install? (Y/n) " RESP
if [ "$RESP" = "Y" ]; then
  echo "Starting Patch Process"
else
  echo "Kernel changes cancelled"
  exit 1
fi
# Start patch process
cd /usr/src/kernel/kernel-4.4
# Make sure that there's a config file
file=".config"
if [ -f "$file" ]
then
	echo "$file found. Patching UVC Video module"
else
	echo "$file not found."
	echo "Kernel source must be installed and configured correctly."
        echo "Exiting"
	exit 1
fi
sudo sed -i 's/.*CONFIG_USB_VIDEO_CLASS=.*/CONFIG_USB_VIDEO_CLASS=m/' .config
sudo patch -p1 -i $HOME/librealsense/scripts/realsense-camera-formats.patch
echo "Building Kernel ... "
# Make the kernel and module to reflect UVC changes
sudo make prepare
sudo make modules_prepare
sudo make -j6
sudo make modules
sudo make modules_install
# Copy over the images to the boot directory; modules should be installed
echo "Copying images to boot directory"
sudo cp arch/arm64/boot/zImage /boot/zImage
sudo cp arch/arm64/boot/Image /boot/Image
/bin/echo -e "\e[1;32mPlease reboot the machine for changes to take effect.\e[0m"



