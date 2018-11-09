cmake_minimum_required(VERSION 3.5)

project(cmake_begin)
message(${PROJECT_BINARY_DIR})
#message(${PROJECT_ROOT_DIR})

#Load and run CMake code from a file or module.
include(cmake/global.cmake)
include(cmake/thirdparty.cmake)
include(cmake/hwloc.cmake)
include(cmake/fucntion_macro_usage.cmake)
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
set(CMAKE_CXX_STANDARD 11)
set(high-level "high-level")

message(${hwloc_INCLUDE_DIR})
include_directories(${hwloc_INCLUDE_DIR})

# 生成动态库　shared 表示so, imported 表示从其他地方导入
add_library(libhwloc SHARED IMPORTED)

#Targets can have properties that affect how they are built.
#
#   set_target_properties(target1 target2 ...
#   PROPERTIES prop1 value1
#   prop2 value2 ...)
set_target_properties(libhwloc PROPERTIES IMPORTED_LOCATION ${hwloc_LIB_DIR}/libhwloc.so)

#Make a top-level <target> depend on other top-level targets to ensure that they build before <target> does.
#A top-level target is one created by ADD_EXECUTABLE, ADD_LIBRARY, or ADD_CUSTOM_TARGET.
add_dependencies(libhwloc hwloc)

message(3 ${hwloc_LIB_DIR})

link_directories(${hwloc_LIB_DIR})
set(Hwloc_LIBRARIES hwloc)
#add_subdirectory(protobuf_begin)
add_subdirectory(src)

#message(${low-level})
message(${low_level_global})




