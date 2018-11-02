set(TEST_FILE "log.txt")
add_custom_command(OUTPUT  ${TEST_FILE}
          COMMAND echo "Generating log.txt file..."
          COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_LIST_FILE} ${TEST_FILE}
          COMMENT  "This is a test"
         )
