//Target Application: ../apks/Privacyfriendlydicer.apk

Java.perform(function() {

    // class reference to the Alien class
    var alienClassReference = Java.use('com.apphacking.fridafunc.Alien');

    // class reference to the Toast class ( we want to display some text on the screen!)
    var toastClassReference = Java.use('android.widget.Toast');

    var context = Java.use('android.app.ActivityThread').currentApplication().getApplicationContext();
    
    
    var stringClassReference = Java.use('java.lang.String');
    var stringInstance =  stringClassReference.$new("Frida is amazing also with the UI - udemy apphacking is also amazing, not just on the UI!");

    // Get onto the main thread and execute what's inside this function.
    Java.scheduleOnMainThread(function() {

        for(var i = 0; i < 1000; i += 100) {
            var alienInstance = alienClassReference.$new(i);
        }

        //method we want to call (toastClassReference) --> makeText (Context context, CharSequence text, int duration) --> (duration = LENGTH_LONG, LENGTH_SHORT)
        toastClassReference.makeText(context, stringInstance, 1).show();

    })
})
