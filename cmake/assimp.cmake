# Ref Link: https://stackoverflow.com/questions/49082471/linking-assimp-library-with-find-package
# Ref Link with the Solution: https://stackoverflow.com/questions/73991892/what-is-the-best-way-to-add-assimp-to-a-cmake-project

include(FetchContent)
# set(FETCHCONTENT_BASE_DIR ${PROJECT_SOURCE_DIR}/libs CACHE PATH "Missing description." FORCE)
FetchContent_Declare(assimp
GIT_REPOSITORY https://github.com/assimp/assimp.git
GIT_TAG master)
set(BUILD_SHARED_LIBS OFF CACHE BOOL "" FORCE)
set(ASSIMP_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(ASSIMP_INJECT_DEBUG_POSTFIX OFF CACHE BOOL "" FORCE)
set(ASSIMP_INSTALL OFF CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(assimp)


target_include_directories(${PROJECT_NAME} PRIVATE /usr/local/external_libs/assimp/include)
target_link_libraries(${PROJECT_NAME} assimp)