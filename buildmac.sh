OPENCV_VERSION=4.7

pwd
      wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip -Oopencv-${OPENCV_VERSION}.zip && unzip opencv-${OPENCV_VERSION}.zip
      wget https://github.com/opencv/opencv_contrib/archive/${OPENCV_VERSION}.zip -Oopencv_contrib-${OPENCV_VERSION}.zip && unzip opencv_contrib-${OPENCV_VERSION}.zip
      cd opencv-${OPENCV_VERSION} && mkdir build && cd build
      cmake \
        -DCMAKE_SYSTEM_PROCESSOR=arm64 \
        -DWITH_OPENJPEG=OFF \
        -DCMAKE_OSX_ARCHITECTURES="x86_64;arm64" \
        -DWITH_IPP=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-${OPENCV_VERSION}/modules \
        -DBUILD_SHARED_LIBS=OFF \
        -DENABLE_CXX11=ON -DBUILD_TESTS=OFF \
        -DBUILD_PERF_TESTS=OFF \
        -DBUILD_DOCS=OFF \
        -DBUILD_EXAMPLES=OFF \
        -DBUILD_JAVA=OFF \
        -DBUILD_opencv_java_bindings_generator=OFF \
        -DBUILD_opencv_python_bindings_generator=OFF \
        -DBUILD_opencv_python_tests=OFF \
        -DBUILD_opencv_ts=OFF \
        -DBUILD_opencv_js=OFF \
        -DBUILD_opencv_js_bindings_generator=OFF \
        -DBUILD_opencv_apps=OFF \
        -DBUILD_opencv_barcode=OFF \
        -DBUILD_opencv_bioinspired=OFF \
        -DBUILD_opencv_ccalib=OFF \
        -DBUILD_opencv_datasets=OFF \
        -DBUILD_opencv_dnn_objdetect=OFF \
        -DBUILD_opencv_dpm=OFF \
        -DBUILD_opencv_fuzzy=OFF \
        -DBUILD_opencv_gapi=ON \
        -DBUILD_opencv_intensity_transform=OFF \
        -DBUILD_opencv_mcc=OFF \
        -DBUILD_opencv_objc_bindings_generator=OFF \
        -DBUILD_opencv_rapid=OFF \
        -DBUILD_opencv_reg=OFF \
        -DBUILD_opencv_stereo=OFF \
        -DBUILD_opencv_structured_light=OFF \
        -DBUILD_opencv_surface_matching=OFF \
        -DBUILD_opencv_wechat_qrcode=ON \
        -DBUILD_opencv_videostab=OFF \
        -DWITH_GSTREAMER=OFF \
        -DWITH_EIGEN=OFF \
        -DWITH_ADE=OFF \
        -DWITH_OPENEXR=OFF \
        -DOPENCV_ENABLE_NONFREE=ON \
        -DCMAKE_INSTALL_PREFIX=${GITHUB_WORKSPACE}/opencv_macos ..
      make -j3
      make install
      cd ${GITHUB_WORKSPACE}
      ls       
