#Add a subdirectory to the build.
#
#add_subdirectory(source_dir [binary_dir]
#[EXCLUDE_FROM_ALL])
#Add a subdirectory to the build.
#The source_dir specifies the directory in which the source CMakeLists.txt and code files are located.
#If it is a relative path it will be evaluated with respect to the current directory (the typical usage),
#but it may also be an absolute path. The binary_dir specifies the directory in which to place the output files.
#If it is a relative path it will be evaluated with respect to the current output directory, but it may also be an absolute path.
#If binary_dir is not specified, the value of source_dir, before expanding any relative path, will be used (the typical usage).
#The CMakeLists.txt file in the specified source directory will be processed immediately by CMake before processing
#in the current input file continues beyond this command.

#https://cmake.org/cmake/help/v3.0/command/add_subdirectory.html?highlight=add_subdirectory
add_subdirectory(external_project)
add_subdirectory(hwloc_example)
#add_subdirectory(protobuf_begin)