#!/bin/bash
if [[ -z "$ABS_PORTION" ]]; then
    echo "You forgot to:"
    echo "export ABS_PORTION=YOUR_ABSOLUTE_PATH_TO_opencv-python-inference-engine_dir"
    exit
fi

#ABS_PORTION=/home/kabakov/TMP/opencv-python-inference-engine
export LD_LIBRARY_PATH=$ABS_PORTION/build/ffmpeg/binaries/lib/:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$ABS_PORTION/build/ffmpeg/binaries/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_LIBDIR=$ABS_PORTION/build/ffmpeg/binaries/lib/:$PKG_CONFIG_LIBDIR
FFMPEG_PATH=$ABS_PORTION/build/ffmpeg/binaries
 
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D OPENCV_FORCE_3RDPARTY_BUILD=ON \
    -D OPENCV_SKIP_PYTHON_LOADER=ON \
    -D BUILD_opencv_python3=ON \
    -D BUILD_opencv_python3.6=ON \
    -D PYTHON3_EXECUTABLE=$ABS_PORTION/venv/bin/python3.6 \
    -D PYTHON3_LIBRARY:PATH=$ABS_PORTION/venv/lib/python3.6/config-3.6m-x86_64-linux-gnu/libpython3.6m.so \
    -D PYTHON3_NUMPY_INCLUDE_DIRS:PATH=$ABS_PORTION/venv/lib/python3.6/site-packages/numpy/core/include \
    -D PYTHON_DEFAULT_EXECUTABLE=$ABS_PORTION/venv/bin/python3.6 \
    -D PYTHON_INCLUDE_DIR=$ABS_PORTION/venv/include/python3.6m \
    -D PYTHON3_PACKAGES_PATH=$ABS_PORTION/venv/lib/python3.6/site-packages \
    -D INSTALL_CREATE_DISTRIB=ON \
    -D ENABLE_CXX11=ON \
    -D WITH_V4L=ON \
    -D WITH_PNG=ON \
    -D WITH_FFMPEG=ON \
    -D FFMPEG_INCLUDE_DIRS=$FFMPEG_PATH/include \
    -D pkgcfg_lib_FFMPEG_avformat=$FFMPEG_PATH/lib/libavformat.so \
    -D pkgcfg_lib_FFMPEG_avcodec=$FFMPEG_PATH/lib/libavcodec.so \
    -D pkgcfg_lib_FFMPEG_avutil=$FFMPEG_PATH/lib/libavutil.so \
    -D pkgcfg_lib_FFMPEG_swscale=$FFMPEG_PATH/lib/libswscale.so \
    -D CMAKE_INSTALL_PREFIX=./binaries/ \
    -D WITH_TBB=ON \
    -D WITH_PROTOBUF=ON \
    -D JPEG_INCLUDE_DIR=$JPEG_INCLUDE_DIR \
    -D JPEG_LIBRARY=$JPEG_LIBRARY \
    -D WITH_GTK=OFF \
    -D BUILD_opencv_python2=OFF \
    -D BUILD_opencv_python2.7=OFF \
    -D BUILD_SHARED_LIBS=OFF \
    -D BUILD_opencv_world=OFF \
    -D INSTALL_PYTHON_EXAMPLES=OFF \
    -D INSTALL_C_EXAMPLES=OFF \
    -D OPENCV_ENABLE_NONFREE=OFF \
    -D BUILD_EXAMPLES=OFF \
    -D BUILD_opencv_java=OFF \
    -D BUILD_opencv_apps=OFF \
    -D CV_TRACE=OFF \
    -D BUILD_TESTS=OFF \
    -D BUILD_PERF_TESTS=OFF \
    -D BUILD_DOCS=OFF \
    -D WITH_QT=OFF \
    -D ENABLE_PRECOMPILED_HEADERS=OFF \
    -D BUILD_JPEG=OFF \
    -D WITH_IPP=OFF \
    -D WITH_JASPER=OFF \
    -D WITH_WEBP=OFF \
    -D WITH_1394=OFF \
    -D WITH_GSTRREAMER=OFF \
    -D WITH_OPENEXR=OFF \
    -D WITH_OPENMP=OFF \
    -D WITH_EIGEN=OFF \
    -D WITH_VTK=OFF \
    -D BUILD_JPEG=OFF \
    -D WITH_CUDA=OFF \
    -D INF_ENGINE_INCLUDE_DIRS=$ABS_PORTION/dldt/inference-engine/include \
    -D INF_ENGINE_LIB_DIRS=$ABS_PORTION/dldt/inference-engine/bin/intel64/Release/lib \
    -D WITH_INF_ENGINE=ON ../../opencv
