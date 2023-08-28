cmake_minimum_required(VERSION 3.5.0)

set(PROJECT_NAME 3DRendererRotatorOnCamera)
project(${PROJECT_NAME} VERSION 0.1.0 LANGUAGES C CXX)

set(CXX_STANDARD 20)

# This is how we are able to simply just include 
# Ref Link: https://stackoverflow.com/questions/8304190/cmake-with-include-and-source-paths-basic-setup

# Ref Link that has the solution: https://stackoverflow.com/questions/73991892/what-is-the-best-way-to-add-assimp-to-a-cmake-project

# This is so we can simply know where the other directories are located in the project
# Such as if we needed to find common we can do ${INCLUDE_DIR}/common instead of manually typing 3DRenderRotator/common
set(PROJECT_INCLUDE_DIR 3DRenderRotator)


# Apply to single targets
# if (CMAKE_COMPILER_IS_GNUCC)
#     target_compile_options(${PROJECT_NAME} PRIVATE -Wall -Wextra -Wno-deprecated-non-prototype)
# endif()

# if(MSVC)
#     target_compile_options(${PROJECT_NAME} /W4)
# endif()

# This is applying to all targets
# These are package maintainers that will let you know what is happening
# Ref Link for these compiler flags: https://stackoverflow.com/questions/14231292/cmake-and-compiler-warnings
if(CMAKE_COMPILER_IS_GNUCC)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -wnoi-deprecated-non-prototype")
endif()


if(MSVC)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wno-deprecated-non-prototype")
endif()


include_directories(
    ${PROJECT_SOURCE_DIR}/${PROJECT_INCLUDE_DIR}/include
    # Uncomment these if you want to directly includes the directories themselves
    # Example: instead of doing: #include "common/Utils.h" you would just be doing "Utils.h"
    # ${PROJECT_SOURCE_DIR}/${PROJECT_INCLUDE_DIR}/include/common
    # ${PROJECT_SOURCE_DIR}/${PROJECT_INCLUDE_DIR}/include/core
)

# aux_source_directory(${PROJECT_SOURCE_DIR}/ProjectCmake/src all_src)

# Better way instead of GLOBBING 
set(
    all_src
    ${PROJECT_SOURCE_DIR}/${PROJECT_INCLUDE_DIR}/src/common/Utils.cpp
)



add_executable(
    ${PROJECT_NAME}
    main.cpp
    ${all_src}
)


# This is how we copy the assets files to the build dir which is where the binary directory is located.
file(COPY ${CMAKE_SOURCE_DIR}/assets DESTINATION ${CMAKE_CURRENT_BINARY_DIR})
add_definitions(-DERESOURCE="assets")


# Letting cmake know that in our current project the cmake modules are located. Just in case we change this cmake
# include() is used to include the cmake configurations to configure the libraries in their seperate cmake, and to put those configurations
# into this cmake.
# Hence, these are the modules needed!
include(${PROJECT_SOURCE_DIR}/cmake/glfw.cmake)
include(${PROJECT_SOURCE_DIR}/cmake/opencv.cmake)
include(${PROJECT_SOURCE_DIR}/cmake/assimp.cmake)
include(${PROJECT_SOURCE_DIR}/cmake/ffmpeg.cmake)