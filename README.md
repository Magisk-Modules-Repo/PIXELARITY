# PIXELARITY

<p align="center">
  <img src="https://github.com/Magisk-Modules-Repo/PIXELARITY/blob/master/.github/logo.png"> 
</p>
 
<p align="center">
  <a href="https://t.me/PIXELARITY"><img src="https://img.shields.io/badge/Telegram-Channel-blue.svg"></a>&emsp;<a href="https://t.me/PIXELARITYCHAT"><img src="https://img.shields.io/badge/Telegram-Group-blue.svg"></a>
</p>
<br/>

PIXELARITY contains pixel exclusives, fix and tweaks to boost user experience on devices running Android Q

# Compatibility
-   [![Android Q](https://img.shields.io/badge/Android-Q-brightgreen.svg)](https://developer.android.com/preview)
-   [![Magisk](https://img.shields.io/badge/Magisk-19%2B-00B39B.svg)](https://forum.xda-developers.com/apps/magisk/official-magisk-v7-universal-systemless-t3473445)
-   [![Beryllium](https://img.shields.io/badge/Pocophone_F1-Beryllium-yellow.svg)](https://www.gsmarena.com/xiaomi_pocophone_f1-9293.php)
-   [![Whyred](https://img.shields.io/badge/Redmi_Note_5/Pro-Whyred-red.svg)](https://www.gsmarena.com/xiaomi_redmi_note_5_pro-8893.php)
-   [![Laviolet](https://img.shields.io/badge/Redmi_Note_7/Pro-Lavender/Violet-violet.svg)](https://www.gsmarena.com/xiaomi_redmi_note_7-9513.php)


ONLY PIXEL Q GSI / ROM IS SUPPORTED FOR NOW

# Changelog

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
- Added Thermals from <a href="t.me/srfariasmau">Eriko</a>
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
- Added Camera Patch from <a href="t.me/nhappymanncp">Bogdan</a>
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

# Notes
- To Fix Microphone Problems Go To
> Settings > Apps & notifications > Default apps > Assist app > Assist app > Set it to None and Set it to Google Again

- To Fix Gcam Proplems Go To Terminal App and Run This Command
```
su -c cmd appops set com.google.android.GoogleCamera android:legacy_storage allow && su -c am force-stop com.google.android.GoogleCamera
```
- For Lavender/Violet Users Use Magisk 19.2 to Pass Safety Net
   
# Instructions
- Download and install the module.

# Credits
- [Gabriel Howard](https://t.me/GabrielHoward) and Pix3lify Devs for my inspiration / motivation to create the module
- [Master Jaymin Suthar](https://t.me/JayminSuthar1001) and [Master Skittles](https://t.me/Skittles9823) for answering my noob questions
- [Master JohnFawkes](https://github.com/JohnFawkes) for helping me to solve anything
- [Zackptg5](https://github.com/Zackptg5) for Unity template
- [topjohnwu](https://github.com/topjohnwu) for Magisk
- All of Telegram Friends that helps me bring up PIXELARITY  
