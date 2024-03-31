### STUFFS TAUGHT:
  - Abusing exported(explicit) and implicit(intents) activities

### GENERAL COMMANDS:
  - show running ports in linux: `netstat -tulpen`
  - unzip .apk file: `unzip <file.apk>`
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
  - install apk: `adb install <filename.apk>`
  - pull a file: `adb pull <file> <dest>`
  - print logcat: `adb logcat`

### ADB SHELL COMMANDS (commands to be executed inside the android device's shell):
  - list apks installed: `pm list packages`
  - print path of an android package installed: `pm path <packagename>`
  - input text to device: `input text <your_text>`
  - start an activity: `am start-activity -n <package_name>/<activity_name>`
    - Example: `am start-activity -n com.mwr.example.sieve/.FileSelectorActivity`
    - **NOTE**: `<package_name>` & `<activity_name>` can be found inside the decompiled **AndroidManifest.xml** file obtained using **apktool**. Also this is possible only if activity is exported(explicit) or if an intent(implicit) is encapsulated

### APKTOOL COMMANDS:
  - decompile apk using apktool: `apktool d <filename.apk>`
  - build apk using apktool: `apktool b <folder_path>/`

### MISC NOTES:
  - **ADB SHELL COMMANDS**:
    - location of start folder in android devices(non rooted): `/sdcard/`
    - location of Android/data folder (non rooted); `/sdcard/Android/data` 
    - location of Android/data folder (rooted); `/storage/emulator/0/Android/data` 
  - **ADB COMMANDS**:
    - hidden folder in linux: `/home/$(whoami)/.android/`
  - cryptography key verification: pub key in `/home/$(whoami)/.android/adbkey.pub` present in pc and pub key in `/data/misc/adb/adb_keys` present in android device(readable only if rooted) must be equal
