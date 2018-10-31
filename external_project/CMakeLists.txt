include(ExternalProject)
#ExternalProject_Add(test-git
#        GIT_REPOSITORY    git@github.com:lilelr/test-git.git
#        )
include(ExternalProject)


#
#if(UNIX)
#    include(ExternalProject)
#
#    get_filename_component(glog_absolute_install_dir ${CMAKE_INSTALL_PREFIX} ABSOLUTE)
#
#    ExternalProject_Add(glog
#            SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}
#            CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/configure --prefix=${glog_absolute_install_dir}
#            CMAKE_GENERATOR 'Unix Makefiles'
#            BUILD_COMMAND ${MAKE}
#            INSTALL_DIR ${glog_absolute_install_dir}
#            INSTALL_COMMAND "${MAKE}")
#endif()
################# hidapi
set(GLOG_URL       https://github.com/google/glog/archive/v0.3.5.zip)

set(GLOG_ROOT ${CMAKE_BINARY_DIR}/thirdparty/glog)
set(GLOG_LIB_DIR ${GLOG_ROOT}/lib)
set(GLOG_INCLUDE_DIR ${GLOG_ROOT}/include)


ExternalProject_Add(glog
        PREFIX ${GLOG_ROOT}
        UPDATE_COMMAND ""
        PATCH_COMMAND ""
        CONFIGURE_COMMAND ${GLOG_ROOT}/src/glog/configure --prefix=${GLOG_ROOT}
        BUILD_COMMAND make
        URL ${GLOG_URL}
        DOWNLOAD_NAME glog-0.3.5.zip)


#ExternalProject_Add(
#        glog
##        UPDATE_COMMAND ""
##        PATCH_COMMAND ""
###        CONFIGURE_COMMAND ${GLOG_ROOT}/src/glog_external/configure --prefix=${GLOG_ROOT}
##        BUILD_COMMAND make
#        URL ${GLOG_URL}
#        DOWNLOAD_NAME glog-0.3.5.zip)

#message(${glog_external})

include_directories(BEFORE ${GLOG_INCLUDE_DIR})
link_directories(${GLOG_LIB_DIR})
add_executable(glog_test glog_test.cpp)

list(APPEND LINKER_LIBS ${GLOG_LIB_DIR})
message(${LINKER_LIBS})
link_directories(${GLOG_LIB_DIR})


add_library(libglog STATIC IMPORTED)
set_target_properties(libglog PROPERTIES IMPORTED_LOCATION ${GLOG_LIB_DIR}/libglog.a)
add_dependencies(libglog glog)

################ test app

#find_library(IOKIT NAMES IOKit)
#find_library(COREFOUNDATION NAMES CoreFoundation)



set(glog_LIBS ${GLOG_LIB_DIR}/libglog.a)
target_link_libraries(glog_test libglog pthread)
#target_link_libraries(glog_test glog)
