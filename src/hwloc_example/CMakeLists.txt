#
#include_directories(
#        ${CMAKE_BINARY_DIR}/src
#        )
#　${protobuf_2_6_LIB_DIR} 定义在cmake/protobuf_download.cmake 中
link_directories(${protobuf_2_6_LIB_DIR})

# 定义要生成的共享库　imported 表明在别处定义好，导入
add_library(lele_protobuf_target SHARED IMPORTED)

# ${protobuf_2_6_TARGET} 定义在　cmake/protobuf_download.cmake 中
set_target_properties(lele_protobuf_target PROPERTIES IMPORTED_LOCATION ${protobuf_2_6_TARGET})

# 添加　libprotobuf.so
add_dependencies(lele_protobuf_target protobuf)

message(39 ${SearchRequest_PROTO})
message(40 ${SearchRequest_PROTO_CC})
message(41 ${SearchRequest_PROTO_H})

set(hwloc_map_SRC hwloc_map.cpp)

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
#Adds -D define flags to the compilation of source files.


PROTOC_COMPILE(${CMAKE_SOURCE_DIR}/src/protobuf_begin/proto SearchRequest ${CMAKE_BINARY_DIR}/src)

add_executable(hwloc_map ${hwloc_map_SRC})
target_link_libraries(hwloc_map libhwloc ${Protobuf_LIBRARY} libproto_search_result)

## 以下写法都可以：
#target_link_libraries(myProject comm)       # 连接libhello.so库，默认优先链接动态库
#target_link_libraries(myProject libcomm.a)  # 显示指定链接静态库
#target_link_libraries(myProject libcomm.so) # 显示指定链接动态库
#
## 再如：
#target_link_libraries(myProject libcomm.so)　　#这些库名写法都可以。
#target_link_libraries(myProject comm)
#target_link_libraries(myProject -lcomm)
#PROTOC_COMPILE(${CMAKE_SOURCE_DIR}/src/protobuf_begin/proto SearchRequest ${CMAKE_BINARY_DIR}/src)
