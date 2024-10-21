cmake_minimum_required(VERSION 3.16)
project(NativeAndroidTest)

set(CMAKE_CXX_STANDARD 17)

set(UNITY_PROJECT_DIR ${CMAKE_SOURCE_DIR}/../UnityProject)

file(READ "${UNITY_PROJECT_DIR}/ProjectSettings/ProjectVersion.txt" file_content)
string(REGEX MATCH "m_EditorVersion:[ ]*([0-9.a-zA-Z]*)" _version_match "${file_content}")
if(_version_match)
    string(REGEX REPLACE "m_EditorVersion:[ ]*([0-9.]+)" "\\1" EDITOR_VERSION "${_version_match}")
    message(STATUS "Editor Version: ${EDITOR_VERSION}")
else()
    message(WARNING "Could not find 'm_EditorVersion' in ProjectVersion.txt")
endif()

if(UNIX)
    include_directories(~/Unity/Hub/Editor/${EDITOR_VERSION}/Editor/Data/PluginAPI/)
elseif(WIN32)
    include_directories(C:/Program\ Files/Unity/Hub/Editor/${EDITOR_VERSION}/Editor/Data/PluginAPI/)
endif()

message(STATUS "System: ${CMAKE_SYSTEM_NAME}")
add_subdirectory(src)
