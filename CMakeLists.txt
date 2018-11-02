cmake_minimum_required(VERSION 3.5)
project(cmake_begin)
message(${PROJECT_BINARY_DIR})
#message(${PROJECT_ROOT_DIR})
include(cmake/global.cmake)
include(cmake/thirdparty.cmake)
set(CMAKE_CXX_STANDARD 11)
set(high-level "high-level")

#add_subdirectory(protobuf_begin)
add_subdirectory(external_project)

#message(${low-level})
message(${low_level_global})

