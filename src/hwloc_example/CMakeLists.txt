


add_library(libhwloc SHARED IMPORTED)
set_target_properties(libhwloc PROPERTIES IMPORTED_LOCATION ${hwloc_LIB_DIR}/libhwloc.so)
add_dependencies(libhwloc hwloc)

message(3 ${hwloc_LIB_DIR})

link_directories(${hwloc_LIB_DIR})
set(Hwloc_LIBRARIES hwloc)
#set(Hwloc_INCLUDE_DIRS /home/lemaker/open-source/hwloc-1.11.11/include)
message(${hwloc_INCLUDE_DIR})
include_directories(${hwloc_INCLUDE_DIR})

# 查找库所在目录FIND_LIBRARY
FIND_LIBRARY(protobuf_LIB protobuf /usr/lib  /usr/local/lib NO_DEFAULT_PATH)
#cmake会在指定目录中查找，如果所有目录中都没有，值RUNTIME_LIB就会被赋为NO_DEFAULT_PATH
message(16 ${protobuf_LIB})
# 如果找到则命名为完整路径　/usr/lib/libprotobuf.so

set(hwloc_map_SRC hwloc_map.cpp)

add_executable(hwloc_map ${hwloc_map_SRC})
target_link_libraries(hwloc_map libhwloc)