#include <IUnityInterface.h>
#include <lib.hpp>

extern "C" int UNITY_INTERFACE_EXPORT UNITY_INTERFACE_API example_function() {
  return get_42();
}
