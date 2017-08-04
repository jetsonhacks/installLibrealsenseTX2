# installLibrealsenseTX2
Install the librealsense for Intel RealSense cameras on the NVIDIA Jetson TX2

These scripts are for installing on L4T 27.1

In order to install the V4L2 version of the librealsense library on the Jetson TX2, a new kernel must be built. Please see:

https://github.com/jetsonhacks/buildJetsonTX2Kernel

for instructions.

Once the source for the kernel has been downloaded and built, the scripts in this repository can be used to build the librealsense library and patch the UVC video driver to recognize the Intel RealSense video modes. First:

$ ./installLibrealsense.sh

Which will install needed dependencies and librealsense repository. The install script will also set udev rules so that the camera may be used in user space.

Once the setup is complete, the library will be built and installed.

After installLibrealsense.sh is finished, run:

$ ./buildPatchedKernel.sh

WARNING! The running kernel will be replaced by whatever is in the /usr/src/kernel directory once the machine is restarted. Please use carefully!

This script will configure the kernel to use the UVC driver as a module, and then apply patches to the UVC driver to recognize the different RealSense video formats. Once the preparation is complete, the module will be installed and the kernel image will be placed in the boot directory.

Note: The script setupTX1.sh is provided for an easy way to turn off USB autosuspend. The USB autosuspend feature is normally turned on to conserve energy usage. However, this has the effect of losing USB camera connections.



