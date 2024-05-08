//Target Application: ../apk/cFinalFuncFrida.apk

var addressOfStrcmp;

// Get the address of the strcmp function
var importFunctionArray = Module.enumerateImports("libnative-lib.so");

importFunctionArray.forEach(function(element) {

    if (element.name.includes("strcmp")) {
        console.log(element.name);
        console.log(element.address);

        addressOfStrcmp = element.address;
    }

})

// introducing a new state to only print out the return value of our strcmp
var isOurFunction = false;

// Interceptor.attach(address, callbacks)
Interceptor.attach(addressOfStrcmp, {
    
    // args[0] --> our value
    // args[1] --> value of the flag
    onEnter: function(args) {

        var userInput =  Memory.readUtf8String(args[0]);

        if (userInput.includes('1234567980')) {
            //send("param1 = " + Memory.readUtf8String(args[0]));
            //send("param2 = " + Memory.readUtf8String(args[1]));
            send("param1 = " + Memory.readCString(args[0]));
            send("param2 = " + Memory.readCString(args[1]));

            isOurFunction = true;
        }
    },
    onLeave: function(ret) {
        // verifying that this is our strcmp which we are intersted in.
        if(isOurFunction) {
            send("return value " + ret.toInt32());
        }

        // setting it back to false --> otherwise all return values afterwards would be printed out.
        isOurFunction = false;
    }

})

// Print out these parameters.
