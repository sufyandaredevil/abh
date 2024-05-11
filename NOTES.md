### STUFFS TAUGHT:
  - Abusing exported(explicit) and implicit(intents) activities
  - Intent Sniffing
  - Broadcast receiver hacking
  - Content Provider SQL Injection
  - Content Provider Path Traversal Attack
  - Reversing Engineering APKS
  - SMALi Code Patching(Logic flipping, Erasing, Label Patching)
  - Dynamic Instrumentation using Frida Framework
  - Reverse Engineering using Ghidra(scratched the surface)

---

### LINKS / TOOLS:
  - [dex2jar](https://github.com/DexPatcher/dex2jar)
  - [dex2jar](https://github.com/DexPatcher/dex2jar)
  - [jd-gui](http://java-decompiler.github.io/)
  - [jadx](https://github.com/skylot/jadx/releases/tag/v1.4.7)
  - [Eclipse IDE](https://eclipseide.org/)
  - [Androguard](https://androguard.readthedocs.io/en/latest/intro/installation.html)
  - [Gephi](https://gephi.org/)
  - [Frida Client](https://frida.re/)
  - [Frida Server](https://github.com/frida/frida/releases)
  - **keytool** (comes with android studio's build-tools)
  - **zigaligner** (comes with android studio's build-tools)
  - **keytool** (comes with jdk)

---

### LOCATIONS TOREM:
  - `~\.android`
  - `~\AppData\Local\Android`
  - `~\AndroidStudioProjects`
  - `~\AppData\Local\Google\AndroidStudio*`

---

### GENERAL COMMANDS/TOREM:
  - show running ports in linux: `netstat -tulpen`
  - unzip .apk file: `unzip <file>.apk`
  - telnetting into AVD(one created with android studio):
    - `telnet 127.0.0.1:5554`
    - `auth <auth token excluding the % delimiter (location will be printed)>`
    - `help [command]`
  - list all emulators available: `emulator -list-avds`
    - `emulator` location:
      - 🪟: `~\AppData\Local\Android\Sdk\emulator`
      - 🐧: `~\Android\Sdk\emulator`

### ADB COMMANDS:
  - print attached devices: `adb devices [-l]`
  - ways to connect to an android device with adb:
    - `adb shell` 
    - `adb -s <serial number from "adb devices" command>`
    - `adb connect <ip address>`
  - port forwarding: `adb forward tcp:<src_pc_port> tcp:<dest_android_port>`
  - port reversing: `adb reverse tcp:<src_android_port> tcp:<dest_pc_port>`
  - push a file: `adb [-s <device_name>] push <file> /sdcard/ | <dest>`
  - kill adb server: `adb kill-server`
  - install apk: `adb install <filename>.apk`
    - `-t` flag to install test packages
  - pull a file: `adb pull <file> <dest>`
  - print logcat: `adb logcat`

### ADB SHELL COMMANDS (commands to be executed inside the android device's shell):
  - list apks installed: `pm list packages`
  - list apks installed with its UID(user id): `pm list packages -U`
  - print path of an android package installed: `pm path <packagename>`
  - input text to device: `input text <your_text>`
  - start an activity (implicit intent): `am start-activity -a <action_name> -c <category_name>`
    - Example: `am start-activity -a com.apphacking.changePin -c "android.intent.category.DEFAULT"`
  - start an activity with key and value(of a string) passed to an implicit intent: `am start-activity -a <action_name> -c <category_name> --es "<key>" "<value>"`
    - Example: `am start-activity -a com.apphacking.changePin -c "android.intent.category.DEFAULT" --es "username" "admin"`
    - **NOTE**: In case there are multiple applications that could react to this intent, the device shows a list of apps the user can forward the request to
  - start an activity (explicit intent): `am start-activity -n <package_name>/.<activity_name>`
    - Example: `am start-activity -n com.mwr.example.sieve/.FileSelectorActivity`
    - **NOTE**:
      - `<package_name>` & `<activity_name>` can be found inside the decompiled **AndroidManifest.xml** file obtained using **apktool**.
      - This is possible only if activity is exported(explicit) or if an intent(implicit) is encapsulated
      - Intent sniffing is not possible as explicit intents are targeted within an application and aren't broadcast to other apps
      - A formal way to trigger(in case of demonstrating the vulnerability as a POC) this activity is to create an app and start it as follows:
        > ```java
        > // following code is also present at .\pocs\sieve\SieveLoginBypass
        > // "empty activity" template selected in android studio
        > package com.hacking.sieveloginbypass;
        > import androidx.appcompat.app.AppCompatActivity;
        > 
        > import android.content.ComponentName;
        > import android.content.Intent;
        > import android.os.Bundle;
        > 
        > public class MainActivity extends AppCompatActivity {
        > 
        >  @Override
        >  protected void onCreate(Bundle savedInstanceState) {
        >    super.onCreate(savedInstanceState);
        >    setContentView(R.layout.activity_main);
        > 
        >    // code - to start the following Activity
        >    // com.mwr.example.sieve / .PWList
        >    Intent intent = new Intent();
        >    //intent.setComponent(new ComponentName("<package_name>","<package_name>.<class_name who's exported/intent encapsulated>"));
        >    intent.setComponent(new ComponentName("com.mwr.example.sieve","com.mwr.example.sieve.PWList"));
        >    startActivity(intent);
        >  }
        > }
        > ```
  - Trigger a broadcast event as a different user: `am broadcast --user <uid> -a <action_name>`
  - Trigger a broadcast event with key and value(of a string): `am broadcast -a <action_name> --es "<key>" "<value>"`
  - Trigger a broadcast event: `am broadcast -a <action_name>`
    - Example: `am -a android.intent.action.BOOT_COMPLETED`
    - **NOTE**:
      - Doing this artificially will let all applications receive the action triggered if a broadcast receiver is setup in code or in the AndroidManifest.xml file
      - Some broadcast event needs root permission to be triggered
      - As mentioned previously, we need a poc application for demonstration if a vulnerability is present(refer pocs/BroadcastHacking/ source)
  - Query content provider: `content query --uri content://<authority>/<table>/<row>`
    - Example: `content query --uri content://com.android.contacts/contacts/2`
  - Read a file using a content provider: `content read --uri content://<authority>/<context_directory>/<filename>`
    - **NOTE**: There's a possibility of a path traversal attack if (../)* pattern is used and if not sanitized in the code side which would eventually lead to gain access to a file that was not intended to be accessed(refer pocs/MusicPlayerPathTraversalPOC/ source)

---

### APK REVERSE ENGINEERING WORKFLOW:
  - <ins>METHOD 1</ins>:  `unzip <file_name>.apk` > decompile: `dex2jar classes.dex` > open with: `jd-gui classes-dex2jar.jar`  
  - <ins>METHOD 2</ins>: `jadx -d <output_folder_name> <package_name>.apk` > Create new java project in `ECLIPSE`(rest all options set to default and clean **src/** folder) > drag and drop all files present inside `<output_folder_name>/sources/*` selecting `Copy files and folders` option (useful to find contextful java class, variable and method names)
  - <ins>METHOD 3</ins>: open <file_name>.apk with `jadx*`  
  - <ins>METHOD 4</ins>: apktool d <file_name>.apk
  - Next follow [these](#keytool-zipalign-jarsigner-apksigner-commands) steps for apk signing and apk bundling

### APKTOOL, JADX, DEX2JAR, JD, ANDROGUARD COMMANDS:
  - **APKTOOL COMMANDS**(smali output):
    - disassemble apk using apktool: `apktool d <filename>.apk`
    - build apk using apktool: `apktool b <folder_path>/`
  - **JADX, JADX-GUI COMMANDS**(java output):
    - decompile in cli: `jadx <file_name>.apk --loglevel ERROR`
    - decompile in gui: `jadx-gui <file_name>.apk`
  - **DEX2JAR, JD-GUI COMMANDS**:
    - decompile classes.dex to *.jar using dex2jar: `dex2jar classes.dex`
      - original script name: `d2j-dex2jar.bat`
    - open *.jar using jd-gui: `jd-gui class classes-dex2jar.jar`
  - **ANDROGUARD COMMANDS**:
    - analyze apk: `androguard analyze <file_name>.apk`
    - decompile apk: `androguard decompile <file_name>.apk`
    - decompile apk mentioning limit, output format in png: `androguard decompile -o <output_folder> -f png --limit '^Lcom/mobisec' <file_name>.apk`
      - **NOTE**: It is recommended to open the output image file using gimp in linux or similar alternative in windows
    - create a call graph for given apk: `androguard cg -o <output_filename>.gml <file_name>.apk`

### KEYTOOL, ZIPALIGN, JARSIGNER, APKSIGNER COMMANDS:
  - Modifying and application(apk) Signing Approach:
    - decompile apk using `apktool d <filename>.apk` and perform the modifications
    - For android version **< 11**:
      - Create a new keystore: `keytool -genkey -v -keystore ~/<user_defined_keystore_filename>.keystore -alias <user_defined_alias_name> -keyalg RSA -keysize 2048 -validity 365`
        - **NOTE**: Here the <user_defined_alias_name> is the reference to the certificate, therefore a single keystore can have multiple certificates
      - Signing the App: `jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore ~/<user_defined_keystore_filename>.keystore <apk_name>.apk <user_defined_alias_name>`
      - To rectify offsets: `zipalign -v 4 <apk_name>.apk <output_apk_name>.apk`
    - For android version **>= 11**:
      - Create a new keystore: `keytool -genkey -v -keystore ~/<user_defined_keystore_filename>.keystore -alias <user_defined_alias_name> -keyalg RSA -keysize 2048 -validity 365`
      - To rectify offsets: `zipalign -v 4 <apk_name>.apk <output_apk_name>.apk`
      - Signing the App: `apksigner sign --ks-key-alias <user_defined_alias_name> -ks ~/<user_defined_keystore_filename>.keystore <output_apk_name>.apk`
    - Uninstall the apk from the android device and perform fresh install using `adb install <output_apk_name>.apk`
      - **NOTE**: Modified APK installation might be blocked by Play Protect so make sure to click **<kbd>INSTALL ANYWAY</kbd>** in the android device
  - Print values from the keystore: `keytool -list -keystore <keystore_filename>.keystore`
  - Print cert present in `<decompiled_apk_folder>/base/dist/out/original/META-INF/`: `keytool -printcert -file <ALIAS_NA>.RSA`

### SMALI TOREM:
  - Smali output created by apktool separates placeholders as `local`(starting with v1 since v0 is usually used for the `this` operator) and `parameter`(starting with p1 since p0 is usually used for the `this` operator) register.
  - Constructor is created in smali even if not explicitly mentioned in code
  - when an instance field(data/class members that ain't static) is initialized with values it is represented differently in smali. For example: if `int a=1` is an integer variable, in smali it would be `int a` and then `a=1` and that too making use of smali's local or parameter registers for intermediate moves
  - Comments in smali output generated by the apktool:
    - `#direct methods` are used for private methods and constructors
    - `#virtual methods` are used for public and protected methods
  - SMALI opcodes:
    - `invoke-direct` - used for calling constructors and private methods
    - `invoke-virtual` - used for calling public and protected methods

---

### FRIDA CLIENT & SERVER SETUP(for ROOTED devices):
  - `pip install` the frida client in pc
  - `adb push` frida server to the respective(make use of `adb shell getprop ro.product.cpu.abilist` to know the server's architecture) android device to `/data/local/tmp`directory (only directory that can execute binaries), `chmod` it to `+x`, `sudo` run it and check whether the cursor stays or blinks which denotes successful running of the server
  - Now using `frida-ps -U` we can check whether the client is able to connect with the server

### FRIDA HOOKING:
  - Get the package identifier: `frida-ps -U`
  - Hook the app: `frida -U <package_identifer>`
    - Example:`frida -U com.apphacking.aes`
  - Know a bit about [Android Activity Lifecycle](https://developer.android.com/guide/components/activities/activity-lifecycle)
  - Now we've just started what's called as **frida-client REPL** (unofficial cause I made this up)
  - Paste the following frida script and hit enter. The purpose of the script is that it logs the `onResume()` method(method names can be found using JADX or any other decompilers) calls made in the hooked Android application before calling its original implementation
    ```js
    //Java.perform() Attaches current thread to the JVM and execute the function passed as an argument
    Java.perform(function() {
      //Retrieves a reference to the Activity class from the Android SDK
      //Example: if our <package_name> is com.hacking.demoapp that has a class DemoClass, we need to create an object we Java.use(): 'com.hacking.demoapp.DemoClass'
      const Activity = Java.use('android.app.Activity');
      //Overrides the onResume() method of the Activity class with a custom implementation
      Activity.onResume.implementation = function () {
        //Sends a message to the Frida client indicating that the onResume() method was called
        send('onResume() got called! Let\'s call the original implementation');
        //Calls the original implementation of the onResume() method for the current instance of the Activity class
        this.onResume();
        //return if the original function returns any context
        //return <context>;
        };
      });
    ```
  - Now lets trigger the `onResume()` method we need to put the app in background and reopen it which inturn prints the following message in the terminal:
    ```sh
    [Android Emulator 5554::<package_id> ]-> message: {'type': 'send', 'payload': "onResume() got called! Let's call the original implementation"} data: None
    ```
  - [More](https://frida.re/docs/javascript-api/)

### FRIDA, FRIDA-PS CLIENT COMMANDS:
  - List all processes running in the server: `frida-ps -U`
  - Hook to given application: `frida -U <package_identifer>`
    - Example: `frida -U com.apphacking.aes`
  - Hook to given application and load script: `frida -U <package_identifer> -l <script_name>`
    - Example: `frida -U com.apphacking.aes -l param_hook.js`
  - Start app from frida client inserting a breakpoint on launch and load script: `frida -U -f <package_identifier> -l <script_name> --pause`
    - Example: `frida -U -f com.secuso.privacyfriendlydicer -l param_hook.js --pause`

### FRIDA-CLIENT REPL COMMANDS:
- Script's code can be executed directly here
- To resume execution - `%resume`

### FRIDA NDK HOOKING:
  - To know about the NDK instrumentation workflow view [REVERSING WITH GHIDRA](#reversing-with-ghidra)
  - NDK Libraries are directly called in a java program by first including them(`static { System.loadLibrary("native-lib); }`) followed by setting up the prototype (`public native String encryptString(String pass, int round);`) and then calling them(`encryptString(password, round);`)
  - The native function implemented in C/C++ always starts with 2 default arguments. For example the above shown `encryptString()`'s definition would be as follows:
    >```c
    > Java_com_apphacking_ndkfrida_MainActivity_decryptString(JNIEnv* env, jobject, jstring password, int rotation){
    > //implementation here
    > }
    >```
    - Here:
      - JNI interface/environment pointer: args[0]
      -  this object : args[1]
      - and the expected parameters(password and rotation) args[2], args[3] and so on if any
  - To perform this hooking we follow the same procedure done when instrumenting java code using `frida -U <package_name>.apk` 
  - When referring arguments during frida instrumentation we use the above indices to perform necessary operations
  - This native code would be present within arch specific folder inside `extracted_apk/.../lib/<arch_specific>/<native_library_files_here>.so`
  - Some variables returned from native code needs to be typecasted within frida script
  - Overwriting if done using `Interceptor.attach()` would mess up the loaded scripts in frida-client so its better to close and re-start the application 
  - [Code](./frida_scripts/ndk_hard.js)

### FRIDA SCRIPTS:
(⚠️) `Make sure to read all NOTE as they make sense in general and not just for the script`
- [Hook target class function, change its implementation by modifying parameters](./frida_scripts/change_param_hook.js) (here we just print them)
- [Return value modification](./frida_scripts/return_value_modify.js)
- [Calling static method](./frida_scripts/static_method_call.js) (After loading script we can use the function name `increaseLevel()` in frida-client REPL)
  - **NOTE**: During live debugging, UI elements wouldn't be updated on modifying values but will in memory unless explicit code has been added(in our case we haven't) in the script
- [Creating a new Object and Calling instance method](./frida_scripts/instance_method_call.js)
  - **NOTE**: Creating an object and calling methods over it are only gonna make changes in it instead of the primary object we're targeting. And here we've done exactly that
- [Existing Instance Searching and Modification](./frida_scripts/existing_instance_modification.js)
- [Function Overloading](./frida_scripts/function_overloading.js)
  - **NOTE**: Frida scripts might not work in cases where we have an android device which has custom or proprietary libraries that are not being supported by frida framework at the moment but maybe in the future, so to check whether there's a problem with the script or the target android device try testing it out on other android devices or VMs
- [Passing Class Instance as a Parameter](./frida_scripts/instance_as_param.js)
- [Passing Existing Class Instance as a Parameter](./frida_scripts/existing_instance_as_param.js)
- [Hooking and Overloading Constructor](./frida_scripts/hooking_constructors.js)
- [Manipulating UI Thread](./frida_scripts/manipulate_ui_thread.js)
- [NDK Hooking (EASY)](./frida_scripts/ndk_easy.js)
- [NDK Hooking (HARD)](./frida_scripts/ndk_hard.js)
- [Hook NDK function, change its implementation by modifying parameters and typecasting](./frida_scripts/ndk_mod_param.js)
  - **NOTE**: Typecasting for different architectures varies for some types
- [Hooking C Library Function (after Ghidra Reconnaissance)](./frida_scripts/hooking_c.js)
- [Hooking C Library Function at a specific offset (after Ghidra Reconnaissance)](./frida_scripts/hooking_spec_offset_c.js)

---

### REVERSING WITH GHIDRA:
- NDK reversing workflow:
  - Decompile apk
  - Analyze java code and make note of the native library you wanna reverse engineer
  - Select the architecture you wanna work with
  - Create a project in Ghidra and add a project folder
  - Make a copy of the architecture specific *.so file into the project folder and start reversing
- When reversing ARM 32 or 64 bit click yes to perform code analysis and make sure the following options are checked:
  - [x] ARM Aggressive Instruction Finder
  - [x] Decompile Parameter ID
- In case of x86 or x86_64:
  - [x] Decompile Parameter ID

---

### MISC:
  - **ADB SHELL COMMANDS**:
    - location of start folder in android devices(non rooted): `/sdcard/`
    - location of Android/data folder (non rooted); `/sdcard/Android/data` 
    - location of Android/data folder (rooted); `/storage/emulator/0/Android/data` 
    - using sharedprefs object in code used to create contents inside `/data/data/<app_dir>` that is only accessible by root or the application itself
    - databases created using the SQLiteOpenHelper class are present in: `/data/data/<package>/db/<database_name>.db`
  - AVD setup using Android Studio supports the following architectures: `x86`, `armeabi-v7a`, `armeabi`
  - Cryptography key verification: pub key in `/home/$(whoami)/.android/adbkey.pub` present in pc and pub key in `/data/misc/adb/adb_keys` present in android device(readable only if rooted) must be equal
