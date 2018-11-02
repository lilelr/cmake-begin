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