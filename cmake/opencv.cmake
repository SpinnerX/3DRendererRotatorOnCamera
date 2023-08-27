# Searching for OpenCV
find_package(OpenCV REQUIRED)

target_link_libraries(
    ${PROJECT_NAME}
    ${OpenCV_LIBS}
)