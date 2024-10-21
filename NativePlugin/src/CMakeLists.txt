add_library(NativePlugin
    SHARED
    plugin.cpp
)

# generate compile_commands.json
set( CMAKE_EXPORT_COMPILE_COMMANDS ON )
