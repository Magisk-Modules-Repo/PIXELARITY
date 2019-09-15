# PIXELARITY
<p align="center">
  <img src="https://github.com/Magisk-Modules-Repo/PIXELARITY/blob/master/.github/pixelarity.png"> 
</p>
 
<p align="center">
  <a href="https://t.me/PIXELARITY"><img src="https://img.shields.io/badge/Telegram-Channel-blue.svg"></a><br/><a href="https://t.me/PIXELARITYCHAT"><img src="https://img.shields.io/badge/Telegram-Group-blue.svg"></a>
</p>
<br/>

PIXELARITY contains pixel exclusives, fix and tweaks to boost user experience on devices running Android 9/10

# Compatibility
- [![Android 9](https://img.shields.io/badge/Android-9-lightgreen.svg)](https://developer.android.com/)
- [![Android 10](https://img.shields.io/badge/Android-10-brightgreen.svg)](https://developer.android.com/)
- [![Magisk](https://img.shields.io/badge/Magisk-19%2B-00B39B.svg)](https://forum.xda-developers.com/apps/magisk/official-magisk-v7-universal-systemless-t3473445)

# List of Not Supported
- Memeui ROM
- Huawei and Samsung Devices

# Notes
- For Those Having Problems Regarding Bootanimation You Can Manually Rename The Bootanimation To Work
  - For A/B Devices
    1. Navigate to /system_root/system/product/media/
    2. Rename bootanimation-dark.zip to bootanimation.zip
    3. Replace existing bootanimation.zip with the renamed file
    4. Reboot
  - For A-Only Devices
    1. Navigate to /system/product/media
    2. Rename bootanimation-dark.zip to bootanimation.zip
    3. Replace existing bootanimation.zip with the renamed file
    4. Reboot

# Instructions
- Download and install the module
- Choose using vol keys
- Reboot after you finished installing

# Changelog
### v3.7
- Bug Fixes and Improvements
- Updated Props
- Fixed SafetyNet
- Fixed Status Bar Padding on Some Android 10 Devices
- Mini Cleanup

### v3.6
- Bug Fixes and Improvements
- Merged Props from QP1A.190711.020 for Android 10
- Added Easle Services
- Updated Bootanimation
- Updated Perms
- Fixed Force Close Google App from Android 9 ROMs
- Fixed Bootloop When Uninstalling the Module
- Removed Scone & Tips for Android 9
- Enhanced Safety Parameters for Confirmed Not Suppoted Phones/R̶O̶M̶
  - Negates Samsung, Huawei Devices
  - N̶e̶g̶a̶t̶e̶s̶ ̶M̶e̶m̶e̶u̶i̶ ̶R̶O̶M̶
- Major Cleanup
  
### v3.5
- Stability and Improvements
- Fixed Android 9 Compatibility
- Fixed Mi 8 SE Overlay
- Added Scone and Tips
- Removed Force Mount (RW) on AB Devices
- Removed Overlays for Android 9 ROMs
- Updated Perms
- Updated Props
- Updated Overlays
- Moved Gaming Mode & Sound Mod to a Separate Moodule
- Renewed Module Build ID for Faster Tracking
- Cleanup

### v3.4
- Major Bug fixes
  - Fixed Module Installation with FDE, LKT & NFS (Can be used with PIXELARITY now)
  - Fixed Soundfx with DTS & ViPER (Can be used with PIXELARITY now)
- Added Option for Fonts
- Adjusted Gaming Mode Tweak Values
- Cleanup

### v3.3
**- General**
- Gaming Mode
  - Improved Memory Management
  - Disabled CPU/GPU Thermal Throttling
  - Fast Charge Enabled
  - VFS Cache Pressure Set to 150
  - Adjusted Entropy Values
  - More...
- Reverted Fonts From Build 31114 with Fixes
- Fixed Mic Issues
- Fixed Static Sounds (Report if your phone still have crackling noise)
- Fixed Signal Drop
- Fixed Asus Sound Issues
- Fixed Padding on Notched Phones
- Fixed In-Call Audio Mi 9 SE
- Initial Support for All Devices on Q GSIs and Pie ROMs (Except Pixels)
- Improved Haptic Feedback
- Improved Network Connectivity
- Updated Overlays
- Corrected Pie Props
- Removed OTA Certs
- Added Config to Enable Max Resolution Videos
- Mini Cleanup

**- Module**
- Fixed Mount on A/B Devices
- Added Device Restrictions (Pixel Phones Wont be Installing the Module Anymore)
- Renewed ASCII Art (To make it readable on recovery)
- Rewrite Code in More Efficient Way
- Updated and Moved Notes in Front of README.md
- Added Choice Not To Change Bootanimation
- Switched Thermal Verification (Now vol- cancel thermal disabling, helpful to set default on legacy device)

### v3.2
**- General**
- Added Q Easter Egg
- Merged Props From QPP6.190730.005
- Revert Fonts From Build 31000
- Fixed Unreadable Characters
- Fixed Dark Bootanimation Thanks to SpeedoWBT 
- Fixed Application of Bootanimation on A/B Devices
- Disable GPU Throttle
- Optimized GPU
- Optimized CPU
- Removed OBB Fix
- Cleanups

**- Lavender / Violet**
- Fixed Bootloop When Disabling Thermals

**- Beryllium**
- Fixed BT Sounds When Thermals Disabled
- Fixed Content Padding
- Removed New Assistant Gesture Animation
- Dropped Statusbar Fixes

**- Wayne / Jasmine Sprout**
- Initial Support
- Adjusted Device Default Content Padding (Requested)

**- Sirius**
- Initial Support

**- Module**
- Get Exact Device Model
- Updated Module Description
- Improved Scripts
- Fixed Misspelled Content
- Added Support For Generic GSI
- Added GNU Public License v3.0
- Added Support For Jasmine Sprout, Wayne, and Sirius
- Added Choice Whether Dark or Light Bootanimation to be Installed

### v3.1
**- General**
- Added OBB Fix
- Added Option to Disabe Thermals
- Updated Fonts
- Updated Props
   
**- Whyred**
- Removed Camera Libs
- Revert Perf Profile (will be installed only if KangarooX detected)
   
**- Lavender / Violet**
- Fixed Status Bar Height
- Fixed Content Padding
- Fixed Safety Net
   
**- Beryllium**
- Fixed Status Bar Height

### v3.0
**- General**
- Updated Fonts
- Updated Overlays
- Prioritize SBC Over AAC
- Removed Thermals
- Removed Perf Profiles
- Removed NFC XMLs (Finally found causing battery drain)
- Props Cleanups

**- Lavender / Violet**
- Fixed Status Bar Padding   
- Added New Google Assistant Gesture Animation
   
**- Beryllium**
- Added New Google Assistant Gesture Animation
   
**- Module**
- Add Lavender, Violet and Beryllium Support
- Add ROM Check Function

### v2.9
**- General**
- Fixed Pixel Style Rounded Corners cant apply other SystemUI Mod
- Fixed Low In-Call Audio
- Fixed Heating Issues
- Updated Wlan Configs
- Updated Sound Trigger & Mixer Paths
- Updated Thermals
- Updated Audio Libs
- Updated Font
- Updated Props
- Set IME Height Ratio to 1
- Added Overlays from Bonito
- Added Adblock Hosts
- Added Daydream Support
- Added Graphics Lib from MIUI
- GPU Tune-Up
- Cleanups
  
**- Module**  
- Fixed Module Installation now you can just flash over the old module
- All New ASCII Art ᕙ(＠°▽°＠)ᕗ
- Used TAR.XZ Compression Format to reduce file size significantly
- Preparation for Lavender and Beryllium

### v2.8
- Fixed Random Reboot and System UI Crash on Whyred Default
- Fixed In-Call whereby cant Turn Off Loudspeaker
- Fixed No In-Call Audio
- Fixed Stutters in Earpiece Speaker
- Updated Props
- Set Google Sans as System Wide Font
- Set Wlan Scan Interval to 180
- Improved Audio Experience
- Improved Gesture Animations
- Improved User Interface FPS
- Improved Mic Quality
- Performance Improvements
- Return of Pixel Style Rounded Corners
- Cleanups

### v2.5
- Fixed SafetyNet Issues Thanks to <a href="t.me/thepaperbag">Alex</a>
- Fixed Initail In-Call Audio
- Fixed "Ok, Google" and Gboard Voice Input Now Works Simultaneously
- Fixed Heating Issues
- Added Thermals from <a href="t.me/srfariasmau">Srfarias</a>
- Updated Props

### v2.0
- Removed VR Maps
- Changed Thermal Values
- Fixed Wifi Not Detecting 5Ghz Band
- Added Wifi Boost
- Added New Assistant Gesture Animation to Whyred Default Mod
- Set 30px Rounded Corners to Whyred Default Mod

### v1.5.2
- Updated Props
- Reduced Module Size Significantly
- Added New Thermals
- Added Camera Patch from <a href="t.me/nhappymanncp">Nhappymann</a>
- Added Smart Replies
- Added Patch to Gboard to have Faster Offline Voice Recognition
- Fixed "Ok, Google" Detection Thanks to <a href="t.me/thepaperbag">Alex</a>
- Removed Ambient Sense (Not Working)
- Removed Dream Liner (Useless)
- Removed Pixel Tips (Useless)
- Removed Easle Services (Crashing)
- Removed Scone (Crashing)
- Changed Rounded Corner From 80px to 70px

### v1.0

- Initial Release

# Credits
- [Gabriel Howard](https://t.me/GabrielHoward) and Pix3lify Devs for my inspiration / motivation to create the module
- [Master Jaymin Suthar](https://t.me/JayminSuthar1001) and [Master Skittles](https://t.me/Skittles9823) for answering my noob questions
- [Master JohnFawkes](https://github.com/JohnFawkes) for helping me to solve anything
- [Zackptg5](https://github.com/Zackptg5) for Unity template
- [topjohnwu](https://github.com/topjohnwu) for Magisk
- All of Telegram Friends that helps me bring up PIXELARITY  
