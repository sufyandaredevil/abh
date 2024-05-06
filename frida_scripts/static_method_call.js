//Target Application: ../apks/fridaFunc.apk

//function created for easy retrieval in frida-client REPL by calling: increaseLevel()
function increaseLevel(){
  Java.perform(function () {
    //Getting the class reference of the static method
    mainAct = Java.use("com.apphacking.fridafunc.MainActivity");
    // calling static method
    mainAct.nextLevel();
    //NOTE: During dynamic instrumentation, UI elements wouldn't be updated on modifying values but will in memory unless explicit code has been added(in our case we haven't) in the script
    //So here we print the changes in logcat using sout()
  });
};
