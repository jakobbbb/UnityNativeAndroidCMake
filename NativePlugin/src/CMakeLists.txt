add_library(NativePlugin
    SHARED
    plugin.cpp
)

install(TARGETS NativePlugin
    DESTINATION ${UNITY_PROJECT_DIR}/Assets/Plugins/
)

# generate compile_commands.json
set( CMAKE_EXPORT_COMPILE_COMMANDS ON )
