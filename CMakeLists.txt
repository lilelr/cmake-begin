cmake_minimum_required(VERSION 3.5)
set(CMAKE_CXX_STANDARD 11)

project(cmake_begin)
message(${PROJECT_BINARY_DIR})
#message(${PROJECT_ROOT_DIR})

### protobuf lib ．so 和头文件， 如果在系统安装目录下找，则像如下写

#set(Protobuf_INCLUDE_DIR /usr/include)
#include_directories(${Protobuf_INCLUDE_DIR})
#link_directories(/usr/lib/)

#set(Protobuf_LIBRARY libprotobuf.so)

###　protobuf lib ．so 和头文件， 如果在系统安装目录下找，则像如上写

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
#add_subdirectory(protobuf_automatic)
#message(${low-level})
message(${low_level_global})

# 编译参数添加，如-O3 优化
ADD_DEFINITIONS(
        -O3 -g -W -Wall
        -Wunused-variable -Wunused-parameter -Wunused-function -Wunused
        -Wno-deprecated -Woverloaded-virtual -Wwrite-strings
        -D__WUR= -D_REENTRANT -D_FILE_OFFSET_BITS=64 -DTIXML_USE_STL
)



#target_link_libraries(lele_protobuf_target pthread)
# PROTOC_COMPILE(${CMAKE_SOURCE_DIR}/src/protobuf_begin/proto SearchRequest ${CMAKE_BINARY_DIR}/src)

#FIND_系列指令主要包含一下指令:
#FIND_FILE(<VAR> name1 path1 path2 ...)
#VAR 变量代表找到的文件全路径,包含文件名
#FIND_LIBRARY(<VAR> name1 path1 path2 ...)
#VAR 变量表示找到的库全路径,包含库文件名
#FIND_PATH(<VAR> name1 path1 path2 ...)
#VAR 变量代表包含这个文件的路径。
#FIND_PROGRAM(<VAR> name1 path1 path2 ...)
#VAR 变量代表包含这个程序的全路径。

#FIND_FILE(protobuf_INC message.h /usr/include/google/protobuf)
#IF(NOT protobuf_INC)
#    message(FATAL_ERROR "could not find message.h needed by protobuf " )
#ELSE(NOT protobuf_INC )
#    message("found message.h, its path is ${protobuf_INC}")
#ENDIF(NOT protobuf_INC)
#
## 查找库所在目录FIND_LIBRARY
#FIND_LIBRARY(protobuf_LIB protobuf /usr/lib  /usr/local/lib NO_DEFAULT_PATH)
##cmake会在指定目录中查找，如果所有目录中都没有，值RUNTIME_LIB就会被赋为NO_DEFAULT_PATH
#
## 后缀名.so 和.a 不要省略
#FIND_PATH(boost_timer_PATH libboost_timer.so /usr/local/lib)
#IF(NOT boost_timer_PATH)
#    message(FATAL_ERROR "could not find boost_timer ")
#
#ELSE(NOT boost_timer_PATH)
#    message("boost_time path is ${boost_timer_PATH}")
#
#ENDIF(NOT boost_timer_PATH)
#message(16 ${protobuf_LIB})
# 如果找到则命名为完整路径　/usr/lib/libprotobuf.so
