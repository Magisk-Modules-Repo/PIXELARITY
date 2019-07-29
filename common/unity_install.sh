# PIXELARITY INSTALL LOGIC

KYLIEKYLER=$(grep_prop ro.product.vendor.device /vendor/build.prop)
ROM=$(grep_prop ro.build.display.id | cut -d'-' -f1)

ui_print " "
ui_print "- Running API check..."

if [ $API -lt 29 ]; then
  sleep 1
  abort "  API not supported, aborting..."
else
  sleep 1
  ui_print "  API level passed"
fi

ui_print " "
ui_print "- Running ROM compatibility check..."

if [ -d /system/product/priv-app/SystemUIGoogle ]; then
  sleep 1
  ui_print "  $ROM is compatible"
else
  sleep 1
  abort "  $ROM is not compatible, aborting..."
fi  

ui_print " "
ui_print "- Decompressing files..."
tar -xf $TMPDIR/PIXELARITY.tar.xz -C $TMPDIR 2>/dev/null
tar -xf $TMPDIR/KYLIEKYLER.tar.xz -C $TMPDIR 2>/dev/null
ui_print " "
ui_print "- Dectecting device..."
sleep 2

if [ $KYLIEKYLER == "whyred" ]; then
  ui_print "  Whyred (Redmi Note 5 / Pro) Detected"
  ui_print " "
   
  OIFS=$IFS; IFS=\|
  case $(echo $(basename $ZIPFILE) | tr '[:upper:]' '[:lower:]') in
    *rcy*) RC=true;;
    *rcn*) RC=false;;
  esac
  IFS=$OIFS

  if [ -z $RC ]; then
    if [ -z $VKSEL ]; then
      ui_print "- Some options not specified in zipname!"
      ui_print " "
      ui_print "- Using defaults if not specified in zipname!"
      [ -z $RC ] && RC=true
    else
      if [ -z $RC ]; then
        ui_print "××××××××××××××××××××××××××××××××××××××××××××××××××××××"
        ui_print "×               CHOOSE WHAT TO INSTALL               ×"
        ui_print "××××××××××××××××××××××××××××××××××××××××××××××××××××××"
        ui_print "×                                                    ×"
        ui_print "×        [VOL+] = Whyred Default Style Corners       ×"
        ui_print "×                                                    ×"
        ui_print "×        [VOL-] = Pixel Style Rounded Corners        ×"
        ui_print "×                                                    ×"
        ui_print "××××××××××××××××××××××××××××××××××××××××××××××××××××××"
        if $VKSEL; then
          RC=true
        else
          RC=false
        fi
      fi            
    fi                 
  else
    ui_print "- Options specified in zipname!"
  fi

  mkdir -p $TMPDIR/system/vendor/overlay $TMPDIR/system/priv-app/QtiAudio
  cp -r -f $TMPDIR/PIXELARITY/Whyred/CameraPatch/system $TMPDIR/system
  cp f $TMPDIR/PIXELARITY/Whyred/CallFix/QtiAudio.apk $TMPDIR/system/priv-app/QtiAudio

  if $RC; then
    ui_print " "
    ui_print "- Whyred Default Style Corners selected"
    cp -f $TMPDIR/PIXELARITY/Whyred/Whyred/framework-res__auto_generated_rro.apk $TMPDIR/system/vendor/overlay
  else
    ui_print " "
    ui_print "- Pixel Style Rounded Corners selected"
    cp -f $TMPDIR/PIXELARITY/Whyred/Pixel/framework-res__auto_generated_rro.apk $TMPDIR/system/vendor/overlay
    cp -f $TMPDIR/PIXELARITY/Whyred/Pixel/pixelarity_kyliekyler.apk $TMPDIR/system/vendor/overlay
  fi 
	 
elif [ $KYLIEKYLER == "lavender" ] || [ $KYLIEKYLER == "violet" ]; then
  mkdir -p $TMPDIR/system/vendor/overlay
  ui_print "  Lavender / Violet (Redmi Note 7 / Pro) Detected"
  cp -f $TMPDIR/PIXELARITY/Laviolet/Laviolet/framework-res__auto_generated_rro.apk $TMPDIR/system/vendor/overlay
  cp -f $TMPDIR/PIXELARITY/Laviolet/Laviolet/pixelarity_kyliekyler.apk $TMPDIR/system/vendor/overlay
  
elif [ $KYLIEKYLER == "beryllium" ]; then
  ui_print "  Beryllium (Pocophone F1) Detected"
  cp -f $TMPDIR/PIXELARITY/Beryllium/Beryllium/framework-res__auto_generated_rro.apk $TMPDIR/system/vendor/overlay
  cp -f $TMPDIR/PIXELARITY/Beryllium/Beryllium/pixelarity_kyliekyler.apk $TMPDIR/system/vendor/overlay
  
else
  abort "  Device not supported, aborting..."
fi    
	