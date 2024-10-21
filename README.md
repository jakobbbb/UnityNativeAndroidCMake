# UnityNativeAndroidTest

This repo contains a CMake-based setup for developing native Unity
plugins for Android as well as Linux and Windows.

The `./NativePlugin` directory contains code to build the plugin, while
`./UnityProject` contains a sample Unity project.  Before opening the
project, you must first compile the native plugin.

## Linux

The following will build the plugin and copy it to the Unity project's
plugin directory:

```bash
cd NativePlugin
make clean && make
```

If your Unity editor is not installed at the default location, i.e. in
`~/Unity`, if you're not using the NDK supplied with Unity or if you
want to install to a different Unity project, you can override one or
more of the following CMake flags:
```bash
make CMAKE_FLAGS="-DUNITY_PROJECT_DIR=/path/to/project -DUNITY_EDITOR=/path/to/Editor -DANDROID_NDK=/path/to/NDK"
```

### For Anrdoid
Instead of just running `make`, run `make anrdoid`.  You may have to
`make clean` beforehand.
