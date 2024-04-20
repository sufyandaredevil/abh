Java.perform(function () {
  Java.choose("com.apphacking.fridafunc.Player", {
    onMatch: function (instance) {
      send("An instance of the player class has been found = ");
    },
    onComplete: function () {
      send("Frida has finished scanning the application memory for player instances");
    }
  })
})
