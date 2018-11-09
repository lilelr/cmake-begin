
message(${high-level})
set(low-level "low-level")
#message(${CMAKE_MODULE_PATH})
#set(CMAKE_MODULE_PATH )


#list(APPEND LINKER_LIBS ${GLOG_LIBRARIES})

#CMAKE_MODULE_PATH
#这个变量用来定义自己的 cmake 模块所在的路径。如果你的工程比较复杂,有可能会自己编写一些 cmake 模块,这些 cmake 模块是随你的工程发布的,为了让 cmake 在处理CMakeLists.txt 时找到这些模块,你需要通过 SET 指令,将自己的 cmake 模块路径设置一下。
#比如
#SET(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
#这时候你就可以通过 INCLUDE 指令来调用自己的模块了。

add_library(libhidapi STATIC IMPORTED)
set_target_properties(libhidapi PROPERTIES IMPORTED_LOCATION ${GFLAG_LIB_DIR}/libgflags.a)
add_dependencies(libhidapi gflag)

#message("20" ${GFLAG_INCLUDE_DIR})
include_directories(${GFLAG_INCLUDE_DIR})
add_executable(gflags_test gflags_test.cpp)
target_link_libraries(gflags_test libhidapi pthread libproto_search_result)