# UnityNativeAndroidCMake

This repo contains a simple CMake-based setup for developing native
Unity plugins for Android as well as Linux and Windows.

The `./NativePlugin` directory contains code to build a sample plugin,
while `./UnityProject` contains a sample Unity project for this plugin.
Before opening the project, you must first compile the native plugin.

## Setup

This repo is configured to work out of the box with the included plugin
and Unity project out of the box, as well as given that your Unity
Editor is installed via Unity Hub at the default location and with NDK
(i.e. Android Build Support) included.  If this is not the case on your
system, or you wish to adapt the CMake setup for your own needs, please
consider the following:

A Unity project into which the plugin is to be installed must be
specified.  This is set by default to `./UnityProject` by default and
can be overridden by setting the `UNITY_PROJECT_DIR` CMake flag.

Given the Unity project, the CMake setup will extract the project's
Unity version and attempt to locate both the Unity Editor (for inclusion
of the Unity header files) as well as the NDK (for native compilation on
Android).

If your Unity editor is not installed at the default location
(`~/Unity/Hub/Editor/<VERSION>/Editor` on Linux,
`C:/Program Files/Unity/Hub/Editor/<VERSION>/Editor"` on Windows),
set the `UNITY_EDITOR` flag accordingly.  Note that the directory this
points to should contain the Unity executable.

If you're not using the NDK supplied with Unity, you must set the
`ANDROID_NDK` flag to the NDK directory.  Note that this is the
directory containing the `ndk-build` and `ndk-gdb` scripts, among
others.


## Building on Linux

The following will build the plugin and copy it to the Unity project's
plugin directory:

```bash
cd NativePlugin
make clean && make
```

You can specify CMake flags for the Unity project directory, as well as
the Unity Editor and NDK locations as follows:
```bash
make CMAKE_FLAGS="-DUNITY_PROJECT_DIR=/path/to/project -DUNITY_EDITOR=/path/to/Editor -DANDROID_NDK=/path/to/NDK"
```

### Building for Android on Linux
Instead of just running `make`, run `make anrdoid`.  You may have to run
`make clean` beforehand.

## Note: Installation to the Unity Project

The plugin will be installed into the Unity project, e.g. at
`Assets/Plugins/Linux/libNativePlugin.so` or
`/Assets/Plugins/Windows/NativePlugin.dll`.
Note that each plugin must have an associated `.meta` file specifying
which platforms to run the plugin on.
These are located in `NativePlugin/meta` and copied to the project's
`Assets` directory along with the native library itself.

This is done because Unity will automatically delete any `.meta` files
referencing files that do not exist.  That is, opening the project on
Linux would auto-delete `NativePlugin.dll.meta`.
