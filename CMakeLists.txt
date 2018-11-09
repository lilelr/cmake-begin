cmake_minimum_required(VERSION 3.5)
set(CMAKE_CXX_STANDARD 11)

project(cmake_begin)
message(${PROJECT_BINARY_DIR})
#message(${PROJECT_ROOT_DIR})

### protobuf lib

set(Protobuf_INCLUDE_DIR /usr/include)
include_directories(${Protobuf_INCLUDE_DIR})
link_directories(/usr/lib/)
set(Protobuf_LIBRARY libprotobuf.so)

###

#Load and run CMake code from a file or module.
include(cmake/global.cmake)
include(cmake/thirdparty.cmake)
include(cmake/hwloc.cmake)
include(cmake/fucntion_macro_usage.cmake)
include(cmake/protobuf_download.cmake)
include(cmake/protobuf_compile.cmake)
include(cmake/add_custom_command.cmake)


#Set a CMake, cache or environment variable to a given value.
#
#set(<variable> <value>
# [[CACHE <type> <docstring> [FORCE]] | PARENT_SCOPE])
#
#If PARENT_SCOPE is present, the variable will be set in the scope above the current scope.
#Each new directory or function creates a new scope.
#This command will set the value of a variable into the parent directory or calling function
#(whichever is applicable to the case at hand). PARENT_SCOPE cannot be combined with CACHE.
set(high-level "high-level")

message(28 ${SearchRequest_PROTO})


#add_subdirectory(protobuf_begin)
add_subdirectory(src)

#message(${low-level})
message(${low_level_global})




