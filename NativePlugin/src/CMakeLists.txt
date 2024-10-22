add_library(NativePlugin
    SHARED
    plugin.cpp
)

target_link_libraries(NativePlugin
    Get42
)

install(TARGETS NativePlugin
    DESTINATION ${UNITY_PROJECT_DIR}/Assets/Plugins/${CMAKE_SYSTEM_NAME}
)
