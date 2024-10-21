add_library(NativePlugin
    SHARED
    plugin.cpp
)

install(TARGETS NativePlugin
    DESTINATION ${UNITY_PROJECT_DIR}/Assets/Plugins/${CMAKE_SYSTEM_NAME}
)
