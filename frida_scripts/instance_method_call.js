//Application to hook: ../apks/fridaFunc.apk

Java.perform(function () { 
  var playerClassReference = Java.use('com.apphacking.fridafunc.Player');
  //similar to Player player = new Player();
  var playerInstance = playerClassReference.$new();
  //calling instance method:
  playerInstance.increaseLive();
  //NOTE: Creating an object and calling methods over it are only gonna make changes in it instead of the primary object we're targetting. And here we've done exactly that
});
