//Target Application: ../apks/fridaNDK.apk

Java.perform(function() {

    // Class reference of the Mainactivity
    var mainActivity = Java.use('com.apphacking.ndkfrida.MainActivity')
    mainActivity.decryptString.implementation = function(param1, param2) {

        send("Param 1 = " + param1)
        send("Param 2 = " + param2)

        // return value
        var returnValue = this.decryptString(param1, 13)

        send("Return value = " + returnValue)

        return returnValue

    }

})
