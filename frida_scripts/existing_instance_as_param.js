//Target Application: ../apks/fridaInstAsParam.apk

Java.perform(function(){

    // Scanning the app memory for an exisiting item instance
    Java.choose('com.apphacking.fridainstance.Item', {
        // If the item instance has been found
        onMatch: function(itemInstance) {
            // Getting the boss class reference
            var bossClassReference =  Java.use('com.apphacking.fridainstance.Boss')
            // Creating a new bossInstance with the item instance (found) as parameter
            var bossInstance = bossClassReference.$new(itemInstance)
        },
        onComplete: function() {
            // Done scanning the app memory
            send("Scanning done")

        }
    })
})
