#include <IUnityInterface.h>
#include <lib.h>

extern "C" int UNITY_INTERFACE_EXPORT UNITY_INTERFACE_API example_function() {
  return get_42();
}
