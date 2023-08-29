# Cmake links: https://github.com/Kitware/VTK/blob/master/CMake/FindPythonModules.cmake
if(NOT TARGET FFMPEG::avutil)
        message("NOT CMAKE ACTUAL MESSAGE ===> FFMPEG HAS NOT BEEN FOUND!\n\n\n")
endif()

if(__APPLE__)
    message("IF-STATEMENT BYPASSED HERE!\n")
    # For ffmpeg
    find_package(PkgConfig REQUIRED)
        pkg_check_modules(LIBAV REQUIRED IMPORTED_TARGET
        libavdevice
        libavfilter
        libavformat
        libavcodec
        libswresample
        libswscale
        libavutil
    )

    # Linking ffmpeg LIBAV library
    target_link_libraries(${PROJECT_NAME} PkgConfig::LIBAV)
endif(__APPLE__)