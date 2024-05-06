//Target Application: ../apks/fridaInstAsParam.apk

// Hooking a constructor
Java.perform(function() {

    var itemClassReference = Java.use('com.apphacking.fridainstance.Item')
    //changing the implementation of the constructor
    itemClassReference.$init.implementation = function(param) {

        send("Item power of the created instance is = " + param)
        // calling the original constructor method by passing modified param: 900000
        this.$init(900000)
    }
})

// Hooking an overloaded constructor
Java.perform(function() {

    var itemClassReference = Java.use('com.apphacking.fridainstance.Item')
    itemClassReference.$init.overload('int').implementation = function(param) {

        send("Item power of the created instance is = " + param)
        this.$init(900000)
    }
})

Java.perform(function() {
    Java.choose('com.apphacking.fridainstance.Item', {

        onMatch: function(instance) {
            send("Instance has been found = " + instance)
            send("itemPower = " + instance.itemPower.value)
        },
        onComplete: function() {
            send("Finished scanning!")
        }
    })
})
