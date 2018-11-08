


add_library(libhwloc STATIC IMPORTED)
set_target_properties(libhwloc PROPERTIES IMPORTED_LOCATION ${hwloc_LIB_DIR}/libhwloc.so)
add_dependencies(libhwloc hwloc)

message(3 ${hwloc_LIB_DIR})

link_directories(${hwloc_LIB_DIR})
set(Hwloc_LIBRARIES hwloc)
#set(Hwloc_INCLUDE_DIRS /home/lemaker/open-source/hwloc-1.11.11/include)
message(${hwloc_INCLUDE_DIR})
include_directories(${hwloc_INCLUDE_DIR})

set(hwloc_map_SRC hwloc_map.cpp)

add_executable(hwloc_map ${hwloc_map_SRC})
target_link_libraries(hwloc_map libhwloc)