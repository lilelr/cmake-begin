
message(${high-level})
set(low-level "low-level")
#message(${CMAKE_MODULE_PATH})
#set(CMAKE_MODULE_PATH )
include(ExternalProject)
#ExternalProject_Add(test-git
#        GIT_REPOSITORY    git@github.com:lilelr/test-git.git
#        )
set(GFLAG_URL       https://github.com/gflags/gflags/archive/master.zip)

set(GFLAG_ROOT ${CMAKE_BINARY_DIR}/thirdparty/gflag)
set(GFLAG_LIB_DIR ${GFLAG_ROOT}/lib)
set(GFLAG_INCLUDE_DIR ${GFLAG_ROOT}/include)

#set(glag_configure ${GFLAG_ROOT}/src/gflag/configure --prefix=${GFLAG_ROOT})
set(glag_configure cd ${GFLAG_ROOT}/src/gflag && cmake -D CMAKE_INSTALL_PREFIX=${GFLAG_ROOT} .)

set(glag_make cd ${GFLAG_ROOT}/src/gflag && make)
set(glag_install cd ${GFLAG_ROOT}/src/gflag && make install)
#https://cmake.org/cmake/help/v3.0/module/ExternalProject.html
ExternalProject_Add(gflag
        URL ${GFLAG_URL} # Full path or URL of source
        DOWNLOAD_NAME gflags-master.zip # File name to store (if not end of URL)
        PREFIX ${GFLAG_ROOT} # Root dir for entire project
        UPDATE_COMMAND ""
        PATCH_COMMAND ""
        CONFIGURE_COMMAND ${glag_configure}  # Build tree configuration command
        BUILD_COMMAND ${glag_make} # Command to drive the native build
        INSTALL_COMMAND ${glag_install} # Command to drive install after build
#        [INSTALL_DIR dir]           # Installation prefix
        )

#list(APPEND LINKER_LIBS ${GLOG_LIBRARIES})

#CMAKE_MODULE_PATH
#这个变量用来定义自己的 cmake 模块所在的路径。如果你的工程比较复杂,有可能会自己编写一些 cmake 模块,这些 cmake 模块是随你的工程发布的,为了让 cmake 在处理CMakeLists.txt 时找到这些模块,你需要通过 SET 指令,将自己的 cmake 模块路径设置一下。
#比如
#SET(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
#这时候你就可以通过 INCLUDE 指令来调用自己的模块了。

add_library(libhidapi STATIC IMPORTED)
set_target_properties(libhidapi PROPERTIES IMPORTED_LOCATION ${GFLAG_LIB_DIR}/libgflags.a)
add_dependencies(libhidapi gflag )


include_directories(GFLAG_INCLUDE_DIR)
#add_executable(gflags_test gflags_test.cpp)
#target_link_libraries(gflags_test libhidapi pthread)