//Target Application: ../apks/fridaNDK.apk

// Address of the function we want to hook
var decryptStringAddress = 0x0;
 
// Getting all exports out of the libnative-lib.so
var exportedFunctions = Module.enumerateExports("libnative-lib.so")
 
// Iterating over this array trying to find decryptString
exportedFunctions.forEach(function(element, index){
 
    // finding the function that contains decryptString
    if(element.name.includes('decryptString')) {
 
        console.log("Name = " + element.name);
        console.log("Pointer = " + element.address);

        // Getting the address of this function
        decryptStringAddress = element.address;
    }
})
 
Interceptor.attach(decryptStringAddress, {
 
    onEnter: function(args) {
        
        // Getting the string-class reference for the type cast
        var stringClassRef = Java.use('java.lang.String');
        // Typecasting the argument 2 to a Java - String
        var stringInstance = Java.cast(ptr(args[2]), stringClassRef);
 
        send("We are in decryptString");
        send("First parameter = " + stringInstance);
        send("Second parameter = " + args[3].toInt32());
    },
    onLeave: function(ret) {

        // Leaving the function
        send("Return value = " + ret);
        send("We are leaving the decryptString function right now");
    }
})
