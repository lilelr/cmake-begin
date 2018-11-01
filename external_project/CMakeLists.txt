
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
#set(GFLAG_INCLUDE_DIR ${GFLAG_ROOT}/include)

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
set_target_properties(libhidapi PROPERTIES IMPORTED_LOCATION GFLAG_LIB_DIR/libgflags.a)
add_dependencies(libhidapi gflag)

set(${CMAKE_MODULE_PATH} ${GFLAG_LIB_DIR}/cmake)

list(
        APPEND CMAKE_MODULE_PATH
        ${GFLAG_LIB_DIR}/cmake
)
#包查找的机制
#find_package()命令会查找moudle目录下的Find <name>.cmake文件。
#
#首先，CMake查找${CMAKE_MODULE_PATH}里的所有文件夹。
#
#然后， CMake查找自己的module目录<CMAKE_ROOT>/share/cmake-x.y/Modules/.
#
#如果找不到上述文件，CMake会查找<Name>Config.cmake或者<lower-case-name&gt-config.cmake文件，这些应该是由库来安装的。
#
#前者叫做module mode后者叫做config module。不论是哪个mode被使用，如果一个package 被找到了，都会生成一系列的变量。
#<Name>_FOUND
#<Name>_INCLUDE_DIRS 或 <Name>_INCLUDES
#<Name>_LIBRARIES 或<Name>_LIBS
#<Name>_DEFINITIONS
#
#所有这些变量都在Find <name>.cmake文件里替换。
# 使用 Find_package 模块
FIND_PACKAGE(gflags)

IF(gflags_FOUND)
    message(${gflags_INCLUDE_DIR})
    message(${gflags_LIBRARIES})
ENDIF(gflags_FOUND)


include_directories(${gflags_INCLUDE_DIR})
add_executable(gflags_test gflags_test.cpp)
target_link_libraries(gflags_test ${gflags_LIBRARIES} pthread)
#target_link_libraries(glog_test glog)
