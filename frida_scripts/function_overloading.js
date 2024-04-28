//Application to hook: Not available
//Script that demonstrates function overloading

Java.perform(function () {
  var random = Java.use("java.security.SecureRandom")
  //overload() function takes in what specific function we wanna call by mentioning the type that the function takes as an string param
  random.nextInt.overload('int').implementation = function (param1) {
    return this.nextInt(param1);
  }
});
