//Target Application: ../apk/cFinalFuncFrida.apk

//getting the base address of this libnative-lib.so library and add the offset to reach the specific strcmp function
//(0x8d6c) is the offset to our strcmp function
var addressToHook = Module.getBaseAddress("libnative-lib.so").add(0x8d6c)

//printing out the parameters

Interceptor.attach(addressToHook, {

  // the single strcmp function within our libnative-lib.so library that performs the check of the flag
  onEnter: function () {
    send("parameter 1 = " + Memory.readCString(args[0]))
    send("parameter 2 = " + Memory.readCString(args[1]))
    //parameter 2 still has some problem from frida's side to print the value
  }

})