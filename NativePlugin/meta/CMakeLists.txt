install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/${CMAKE_SYSTEM_NAME}
    DESTINATION ${UNITY_PROJECT_DIR}/Assets/Plugins
    FILES_MATCHING
    PATTERN "*.meta"
)
