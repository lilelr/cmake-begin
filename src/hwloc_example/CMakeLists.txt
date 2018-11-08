


add_library(libhwloc SHARED IMPORTED)
set_target_properties(libhwloc PROPERTIES IMPORTED_LOCATION ${hwloc_LIB_DIR}/libhwloc.so)
add_dependencies(libhwloc hwloc)

message(3 ${hwloc_LIB_DIR})

link_directories(${hwloc_LIB_DIR})
set(Hwloc_LIBRARIES hwloc)
#set(Hwloc_INCLUDE_DIRS /home/lemaker/open-source/hwloc-1.11.11/include)
message(${hwloc_INCLUDE_DIR})
include_directories(${hwloc_INCLUDE_DIR})

#FIND_系列指令主要包含一下指令:
#FIND_FILE(<VAR> name1 path1 path2 ...)
#VAR 变量代表找到的文件全路径,包含文件名
#FIND_LIBRARY(<VAR> name1 path1 path2 ...)
#VAR 变量表示找到的库全路径,包含库文件名
#FIND_PATH(<VAR> name1 path1 path2 ...)
#VAR 变量代表包含这个文件的路径。
#FIND_PROGRAM(<VAR> name1 path1 path2 ...)
#VAR 变量代表包含这个程序的全路径。

FIND_FILE(protobuf_INC message.h /usr/include/google/protobuf)
IF(NOT protobuf_INC)
    message(FATAL_ERROR "could not find message.h needed by protobuf " )
ELSE(NOT protobuf_INC )
    message("found message.h, its path is ${protobuf_INC}")
ENDIF(NOT protobuf_INC)

# 查找库所在目录FIND_LIBRARY
FIND_LIBRARY(protobuf_LIB protobuf /usr/lib  /usr/local/lib NO_DEFAULT_PATH)
#cmake会在指定目录中查找，如果所有目录中都没有，值RUNTIME_LIB就会被赋为NO_DEFAULT_PATH

# 后缀名.so 和.a 可以省略
FIND_PATH(boost_timer_PATH libboost_timer /usr/local/lib)
IF(NOT boost_timer_PATH)
    message(FATAL_ERROR "could not find boost_timer ")

ELSE(NOT boost_timer_PATH)
    message("boost_time path is ${boost_timer_PATH}")

ENDIF(NOT boost_timer_PATH)
message(16 ${protobuf_LIB})
# 如果找到则命名为完整路径　/usr/lib/libprotobuf.so



set(hwloc_map_SRC hwloc_map.cpp)

add_executable(hwloc_map ${hwloc_map_SRC})
target_link_libraries(hwloc_map libhwloc)