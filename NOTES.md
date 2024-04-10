### STUFFS TAUGHT:
  - Abusing exported(explicit) and implicit(intents) activities
  - Intent Sniffing
  - Broadcast receiver hacking
  - Content Provider SQL Injection
  - Content Provider Path Traversal Attack

### GENERAL COMMANDS:
  - show running ports in linux: `netstat -tulpen`
  - unzip .apk file: `unzip <file>.apk`
  - telnetting into AVD(one created with android studio):
    - `telnet 127.0.0.1:5554`
    - `auth <auth token excluding the % delimiter (location will be printed)>`
    - `help [command]`

### ADB COMMANDS:
  - print available devices: `adb devices`
  - ways to connect to an android device with adb:
    - `adb shell` 
    - `adb -s <serial number from "adb devices" command>`
    - `adb connect <ip address>`
  - port forwarding: `adb forward tcp:<src_pc_port> tcp:<dest_android_port>`
  - port reversing: `adb reverse tcp:<src_android_port> tcp:<dest_pc_port>`
  - push a file: `adb [-s <device_name>] push <file> /sdcard/ | <dest>`
  - kill adb server: `adb kill-server`
  - install apk: `adb install <filename>.apk`
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

### APKTOOL COMMANDS:
  - decompile apk using apktool: `apktool d <filename>.apk`
  - build apk using apktool: `apktool b <folder_path>/`

### KEYTOOL, ZIPALIGN, JARSIGNER, APKSIGNER:
  - Modifying and application(apk) Signing Approach:
    - decompile apk using `apktool d <filename>.apk` and perform the modifications
    - For android version **< 11**:
      - Create a new keystore: `keytool -genkey -v -keystore ~/<user_defined_keystore_filename>.keystore -alias <user_defined_alias_name> -keyalg RSA -keysize 2048 -validity 365`
        - **NOTE**: Here the <user_defined_alias_name> is the reference to the certificate, so therfore a single keystore can have multiple certificates
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

### MISC NOTES:
  - **ADB SHELL COMMANDS**:
    - location of start folder in android devices(non rooted): `/sdcard/`
    - location of Android/data folder (non rooted); `/sdcard/Android/data` 
    - location of Android/data folder (rooted); `/storage/emulator/0/Android/data` 
    - using sharedprefs object in code used to create contents inside `/data/data/<app_dir>` that is only accessible by root or the application itself
    - databases created using the SQLiteOpenHelper class are present in: `/data/data/<package>/db/<database_name>.db`
  - **ADB COMMANDS**:
    - hidden folder in linux: `/home/$(whoami)/.android/`
  - cryptography key verification: pub key in `/home/$(whoami)/.android/adbkey.pub` present in pc and pub key in `/data/misc/adb/adb_keys` present in android device(readable only if rooted) must be equal
