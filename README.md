# installLibrealsenseTX1
JetsonHacks Install librealsense for Intel RealSense cameras on Jetson TX2 Development Kit

This is for version L4T 28.1 (JetPack 3.1)

To install the librealsense library:

$ ./installLibrealsense.sh

Which will install needed dependencies, and then the librealsense repository. The install script will also patch librealsense to find the built-in uvcvideo module, and set udev rules so that the camera may be used in user space.

Once the setup is complete, the library will be built and installed.


Note that earlier versions of these scripts are in Tags. 

