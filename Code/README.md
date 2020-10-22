#### Test result with the sample data captured in front of the University.

##### Test procedure
1. Prepare street tree pictures 
2. Performing semantic segmentation (a. overlaid with original picture, b. only classified one)
3. Analyze result picture (see CroppedImageAnalysis.r)

##### Extract biometrics of the tree
1. Use semantic segmentation data and bounding box from YOLO.
2. Crop area for each bounding box.
3. After cropping individual tree, calculate the number of vegetation pixels from the top to the bottom (convert 0 to NA)
    *![](../Data/Analysis/Pixel_Analysis_Sample_data_1.png)
    * The maximum number of pixels for a row is the width of the crown.
    * The point that the number of pixels changed suddenly can be a point of the height below crown.
    * The median value of the numbers for each row below sudden changing point can be a DBH.
    * The height of the tree can be a number of columns that have vegetation pixels.
4. Equation
    * Focal length (Not the real focal length) = (Distance x Pixels) / Width (or Height)
    * If we know the distance and focal length,
    * W = D x P / F

5. F means focal length in pixels
    1. [First method](https://kr.mathworks.com/matlabcentral/answers/10762-how-do-i-convert-focal-length-from-mm-to-pixels)
        * F (pixels) = ImageWidth (pixels) x focalLength (mm) / CCDWidth (mm) 
    2. [Second method](https://medium.com/@biga.david/focal-length-conversion-to-pixels-for-distance-calculation-android-71a0e2e8753b)
        * F (pixels) = ImageWidth (pixels) * 0.5 / tan(horizontalViewAngle(FOV) x 0.5 x PI/180)
        * ImageWidth can be obtained from Preview in Android and horizontalViewAngle is provided by manufacturer of the phone.
        * [Camera Specs for I-Phone](https://developer.apple.com/library/archive/documentation/DeviceInformation/Reference/iOSDeviceCompatibility/Cameras/Cameras.html)

6. Information of the camera and their sensor
    1. Pocophone F1 camera specs: [DXOMARK](https://www.dxomark.com/xiaomi-pocophone-f1-camera-review/), [Ubergizmo](https://www.ubergizmo.com/products/lang/en_us/devices/pocophone-f1/), [gadets.ndtv](https://gadgets.ndtv.com/poco-f1-5591), and [devicesspecifications](https://www.devicespecifications.com/en/comparison/a1a8115962)
    2. Specifications of the image sensor: [Wikipedia](https://en.wikipedia.org/wiki/Image_sensor_format#Table_of_sensor_formats_and_sizes)
    3. Specifications of the Sony image sensor: [Wikipedia](https://en.wikipedia.org/wiki/Exmor)

