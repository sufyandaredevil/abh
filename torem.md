### GENERAL COMMANDS:
  - show running ports in linux:
    - `netstat -tulpen`
  - telnetting into AVD(one created with android studio):
    - `telnet 127.0.0.1:5554`
    - `auth <auth token excluding the % delimiter (location will be printed)>`
    - `help [command]`
  - unzip .apk file:
    - `unzip <file.apk>`

### ADB COMMANDS:
  - print available devices:
    - `adb devices`
  - ways to connect to an android device with adb:
    - `adb shell` 
    - `adb -s <serial number from "adb devices" command>`
    - `adb connect <ip address>`
  - port forwarding:
    - `adb forward tcp:<src_pc_port> tcp:<dest_android_port>`
  - port reversing:
    - `adb reverse tcp:<src_android_port> tcp:<dest_pc_port>`
  - push a file:
    - `adb [-s <device_name>] push <file> /sdcard/ | <dest>`
  - kill adb server:
    - `adb kill-server`
  - install apk:
    - `adb install <filename.apk>`
  - pull a file:
    - `adb pull <file> <dest>`

### ADB SHELL COMMANDS (commands to be executed inside the android device's shell):
  - list apks installed:
    - `pm list packages`
  - print path of an android package installed:
    - `pm path <packagename>`
  - input text to device:
    - `input text <your_text>`
  - start an activity:
    - `am start-activity -n <package_uuid>/<activity_name>`
    - example: `am start-activity -n com.mwr.example.sieve/.FileSelectorActivity`
    - NOTE: possible only if activity is exported or intent added

### APKTOOL COMMANDS:
  - decompile apk using apktool:
    - `apktool d <filename.apk>`
  - build apk using apktool:
    - `apktool b <folder_path>/`

### MISC NOTES:
  - location of start folder in android devices(non rooted): `/sdcard/`
  - hidden folder in linux: `/home/$(whoami)/.android/`
  - cryptography key verification: public key in `/home/${whoami}/.android/adbkey.pub` present in pc and public key in `/data/misc/adb/adb_keys` present in android device
