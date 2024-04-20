//Application to hook: RootCheck (apk not present)
//Script that hooks isDeviceRooted() and modifies return value

Java.perform(function () {
  const rootUtil = Java.use("com.apphacking.rootcheck.RootUtil")
  rootUtil.isDeviceRooted.implementation = function () {
    return false;
  }
});
