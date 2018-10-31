

# Find required protobuf package
find_package(Protobuf REQUIRED)
if(PROTOBUF_FOUND)
    message(STATUS "protobuf library found")
else()
    message(FATAL_ERROR "protobuf library is needed but cant be found")
endif()
include_directories(${PROTOBUF_INCLUDE_DIRS})
include_directories(${CMAKE_CURRENT_BINARY_DIR})
PROTOBUF_GENERATE_CPP(PROTO_SRCS PROTO_HDRS SearchRequest.proto)

add_executable(Demo1 demo1.cpp ${PROTO_SRCS} ${PROTO_HDRS})

target_link_libraries(Demo1 ${PROTOBUF_LIBRARIES})

message(${high-level})

set(low-level "low-level")

