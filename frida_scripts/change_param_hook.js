//Application to hook: ../apks/Privacyfriendlydicer.apk
//Script that hooks int rollDice(int poolSize, int faceNum), print param values and return

Java.perform(function () {
  //Get a reference in myDicer of the class "Dicer"
  var myDicer = Java.use('org.secuso.privacyfriendlydicer.dicer.Dicer');

  myDicer.rollDice.implementation = function (param1, param2) {
    //Print out param* values
    send("Parameter 1 = " + param1);
    send("Parameter 2 = " + param2);

    //calling the original method and return
    return this.rollDice(param1, param2);
    //here's where param1, param2 can be modified
  }

});
