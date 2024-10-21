cmake_minimum_required(VERSION 3.16)

# Root directory of the unity project into which the plugin is to be copied
if(NOT DEFINED UNITY_PROJECT_DIR)
    set(UNITY_PROJECT_DIR ${CMAKE_SOURCE_DIR}/../UnityProject)
endif()

# Get Editor version from ProjectSettings
file(READ "${UNITY_PROJECT_DIR}/ProjectSettings/ProjectVersion.txt" file_content)
string(REGEX MATCH "m_EditorVersion:[ ]*([0-9.a-zA-Z]*)" _version_match "${file_content}")
if(_version_match)
    string(REGEX REPLACE "m_EditorVersion:[ ]*([0-9.]+)" "\\1" EDITOR_VERSION "${_version_match}")
    message(STATUS "Editor Version: ${EDITOR_VERSION}")
else()
    message(WARNING "Could not find 'm_EditorVersion' in ProjectVersion.txt")
endif()

# Set path to Editor (used for headers as well as NDK)
if(NOT DEFINED UNITY_EDITOR)
    if(UNIX)
        set(UNITY_EDITOR ~/Unity/Hub/Editor/${EDITOR_VERSION}/Editor)
    elseif(WIN32)
        set(UNITY_EDITOR "C:/Program Files/Unity/Hub/Editor/${EDITOR_VERSION}/Editor")
    endif()
endif()

# Set up compilation using NDK
if(DEFINED CMAKE_SYSTEM_NAME AND CMAKE_SYSTEM_NAME STREQUAL Android)
    if(WIN32)
        message(WARNING "Compilation for Android has not been tested on Windows yet.")
    endif()
    if(NOT DEFINED ANDROID_NDK)
        set(ANDROID_NDK ${UNITY_EDITOR}/Data/PlaybackEngines/AndroidPlayer/NDK)
    endif()
    set(CMAKE_TOOLCHAIN_FILE "${ANDROID_NDK}/build/cmake/android.toolchain.cmake")
    set(ANDROID_ABI arm64-v8a)
    include(${CMAKE_TOOLCHAIN_FILE})  # must be done before project()
endif()


project(NativeAndroidTest)
set(CMAKE_CXX_STANDARD 17)

include_directories(${UNITY_EDITOR}/Data/PluginAPI/)

message(STATUS "System: ${CMAKE_SYSTEM_NAME}")
message(STATUS "System: ${ANDROID_ABI}")

add_subdirectory(src)
add_subdirectory(meta)
