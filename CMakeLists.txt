#include(${CMAKE_CURRENT_SOURCE_DIR}/kernel/settings.cmake)

cmake_minimum_required(VERSION 3.7.2)
# declare the hello-world CMake project and the languages it is written in (just C)
project(hello-world C ASM)

# In future tutorials, these setup steps will be replaced with
# sel4_tutorials_setup_roottask_tutorial_environment()
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/seL4")
find_package(seL4 REQUIRED)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/musllibc")
find_package(musllibc REQUIRED)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/util_libs")
find_package(util_libs REQUIRED)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/seL4_libs")
find_package(seL4_libs REQUIRED)

sel4_import_kernel()

# This sets up environment build flags and imports musllibc and runtime libraries.
musllibc_setup_build_environment_with_sel4runtime()
sel4_import_libsel4()
util_libs_import_libraries()
sel4_libs_import_libraries()

# Name the executable and list source files required to build it
add_executable(hello-world src/main.c)

# List of libraries to link with the application.
target_link_libraries(hello-world
    sel4runtime sel4
    muslc utils sel4muslcsys sel4platsupport sel4utils sel4debug)

# Tell the build system that this application is the root task. 
include(rootserver)
DeclareRootserver(hello-world)
