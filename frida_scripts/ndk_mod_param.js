//Target Application: ../apks/fridaNDK.apk

var decryptStringAddress
 
// decryptString(String pw, int round) --> libnative-lib.so
// 1. address of this function --> Module.enumerateExports
var exportFunctionArray = Module.enumerateExports("libnative-lib.so")
 
// Iterating over this array trying to find decryptString
exportedFunctions.forEach(function(element, index){
 
  // finding the function that contains decryptString
  if(element.name.includes('decryptString')) {

    console.log("Name = " + element.name)
    console.log("Address = " + element.address)

    decryptStringAddress = element.address
  }
})
 
Interceptor.attach(decryptStringAddress, {
 
  onEnter: function(args) {
    send("We are in decryptString");

    //modifying param value to "Overwriting the argument!"
    args[2] = Java.vm.getEnv().newStringUtf("Overwriting the argument!")
    // for more functions like newStringUtf(), refer: https://github.com/frida/frida-java-bridge/blob/main/lib/env.js

    //modifying param value to 0
    args[3] = ptr(0)

  },
  onLeave: function(ret) {
    var returnValue = Java.vm.getEnv().newStringUtf("Overwriting the return value")

    // using replace() to modify and return the value
    ret.replace(returnValue)

    send("We are leaving the decryptString function right now");
  }
})
