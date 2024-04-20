//Application to hook: ../apks/fridaFunc.apk

Java.perform(function () {
  //Java.choose(<app_identifier>.<class_name>, callback) scans the application memory space for existing instances of the Player Class
  Java.choose('com.apphacking.fridafunc.Player', {
    //onMatch - callback this function if an instance is found
    onMatch: function (instance) {
      send("An instance of the player class has been found = " + instance);
      //in code the following looks like: class Player{ int lives = 5 }
      // instance.lives.value = 9005;
      // likewise calling instance's method:
      // instance.increaseLevel();
      send("The instance lives = " + instance.lives.value);
    },
    //onComplete - callback this function after all instances has been enumerated
    onComplete: function () {
      send("Frida has finished scanning the application memory for player instances");
    }
  })
});
