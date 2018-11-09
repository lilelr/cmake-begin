# In this case, this function would:
#
#   (1) compile the `include/mesos/mesos.proto`, which would generate the files
#       `build/include/mesos/mesos.pb.h` and `build/include/mesos/mesos.pb.cc`
#   (2) export the following variables, based on the `BASE_NAME` parameter
#       (a) MESOS_PROTO:    ${MESOS_ROOT}/include/mesos/mesos.proto
#       (b) MESOS_PROTO_CC: ${MESOS_ROOT}/build/include/mesos/mesos.pb.cc
#       (a) MESOS_PROTO_H:   ${MESOS_ROOT}/build/include/mesos/mesos.pb.h

function(PROTOC_TO_INCLUDE_DIR BASE_NAME BASE_DIR_STRUCTURE)

    set(TO_INCLUDE_DIR
            -I${MESOS_PUBLIC_INCLUDE_DIR}
            -I${MESOS_SRC_DIR}
            --cpp_out=${MESOS_BIN_INCLUDE_DIR})

    # Names of variables we will be publicly exporting.
    set(PROTO_VAR ${BASE_NAME}_PROTO)    # e.g., MESOS_PROTO
    set(CC_VAR    ${BASE_NAME}_PROTO_CC) # e.g., MESOS_PROTO_CC
    set(H_VAR     ${BASE_NAME}_PROTO_H)  # e.g., MESOS_PROTO_H

    # Fully qualified paths for the input .proto files and the output C files.
    set(PROTO ${MESOS_PUBLIC_INCLUDE_DIR}/${BASE_DIR_STRUCTURE}.proto)
    set(CC    ${MESOS_BIN_INCLUDE_DIR}/${BASE_DIR_STRUCTURE}.pb.cc)
    set(H     ${MESOS_BIN_INCLUDE_DIR}/${BASE_DIR_STRUCTURE}.pb.h)

    # Export variables holding the target filenames.
    set(${PROTO_VAR} ${PROTO} PARENT_SCOPE) # e.g., mesos/mesos.proto
    set(${CC_VAR}    ${CC}    PARENT_SCOPE) # e.g., mesos/mesos.pb.cc
    set(${H_VAR}     ${H}     PARENT_SCOPE) # e.g., mesos/mesos.pb.h

    # Compile the .proto file.
    ADD_CUSTOM_COMMAND(
            OUTPUT ${CC} ${H}
            COMMAND ${PROTOC} ${TO_INCLUDE_DIR} ${PROTO}
            DEPENDS make_bin_include_dir ${PROTO}
            WORKING_DIRECTORY ${MESOS_BIN})
endfunction()

PROTOC_TO_INCLUDE_DIR(LELEMASTER                mesos/lelemaster)