cmake_minimum_required(VERSION 3.5)
project(cmake_begin)

set(CMAKE_CXX_STANDARD 11)
set(high-level "high-level")

add_subdirectory(protobuf_begin)
add_subdirectory(external_project)

#message(${low-level})

