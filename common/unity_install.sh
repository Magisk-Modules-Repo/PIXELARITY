# PIXELARITY INSTALL LOGIC

KYLIEKYLER=$(grep_prop ro.product.vendor.device /vendor/build.prop)
ROM=$(grep_prop ro.build.display.id | cut -d'-' -f1)
FIX=/system/bin/migrate_legacy_obb_data.sh

OIFS=$IFS; IFS=\|
case $(echo $(basename $ZIPFILE) | tr '[:upper:]' '[:lower:]') in
  *rcy*) RC=true;;
  *rcn*) RC=false;;
esac
case $(echo $(basename $ZIPFILE) | tr '[:upper:]' '[:lower:]') in
  *obby*) OBB=true;;
  *obbn*) OBB=false;;
esac
case $(echo $(basename $ZIPFILE) | tr '[:upper:]' '[:lower:]') in
  *dtty*) DTT=true;;
  *dttn*) DTT=false;;
esac
case $(echo $(basename $ZIPFILE) | tr '[:upper:]' '[:lower:]') in
  *dttcy*) DTTC=true;;
  *dttcn*) DTTC=false;;
esac
IFS=$OIFS
  
ui_print " "
ui_print "- Running API check..."

if [ $API -lt 29 ]; then
  sleep 1
  abort "  API level $API not supported, aborting..."
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
  cp -f $TMPDIR/PIXELARITY/Whyred/5277/CallFix/QtiAudio.apk $TMPDIR/system/priv-app/QtiAudio

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
  
  ui_print " "
  ui_print "- Checking kernel..."
  
  if [ -e /vendor/etc/init/hw/init.kangaroox.rc ]; then
    ui_print "  KangarooX kernel detected"
    sleep 2
    mkdir -p $TMPDIR/system/vendor/etc
    ui_print " "
    ui_print "- Applying perf patch..."
    sleep 1
    cp -rf $TMPDIR/PIXELARITY/Whyred/5277/perf $TMPDIR/system/vendor/etc
    ui_print "  Perf patch applied"
  else
    sleep 1
    ui_print "  KangarooX kernel not detected, perf patch not needed"
  fi  
	 
elif [ $KYLIEKYLER == "lavender" ] || [ $KYLIEKYLER == "violet" ]; then
  mkdir -p $TMPDIR/system/vendor/overlay
  ui_print "  Lavender / Violet (Redmi Note 7 / Pro) Detected"
  cp -f $TMPDIR/PIXELARITY/Laviolet/Laviolet/framework-res__auto_generated_rro.apk $TMPDIR/system/vendor/overlay
  cp -f $TMPDIR/PIXELARITY/Laviolet/Laviolet/pixelarity_kyliekyler.apk $TMPDIR/system/vendor/overlay
  
elif [ $KYLIEKYLER == "beryllium" ]; then
  mkdir -p $TMPDIR/system/vendor/overlay
  ui_print "  Beryllium (Pocophone F1) Detected"
  cp -f $TMPDIR/PIXELARITY/Beryllium/Beryllium/framework-res__auto_generated_rro.apk $TMPDIR/system/vendor/overlay
  cp -f $TMPDIR/PIXELARITY/Beryllium/Beryllium/pixelarity_kyliekyler.apk $TMPDIR/system/vendor/overlay
  
else
  abort "  Device not supported or using modified build.prop, aborting..."
fi  

if [ -z $OBB ]; then
  if [ -z $VKSEL ]; then
    ui_print "- Some options not specified in zipname!"
    ui_print " "
    ui_print "- Using defaults if not specified in zipname!"
    [ -z $OBB ] && OBB=false
  else
    if [ -z $OBB ]; then
      ui_print " "
      ui_print "××××××××××××××××××××××××××××××××××××××××××××××××××××××"
      ui_print "×            DO YOU WANT TO APPLY OBB FIX?           ×"
      ui_print "××××××××××××××××××××××××××××××××××××××××××××××××××××××"
      ui_print "×                                                    ×"
      ui_print "×             [VOL+] = YES   [VOL-] = NO             ×"
      ui_print "×                                                    ×"
      ui_print "××××××××××××××××××××××××××××××××××××××××××××××××××××××"
      if $VKSEL; then
        OBB=true
      else
        OBB=false
      fi
    fi            
  fi                 
else
  ui_print "- Options specified in zipname!"
fi
  
if $OBB; then
  if [ -s $FIX ]; then
    mkdir -p $TMPDIR/system/bin
    ui_print " "
    ui_print "- Applying OBB fix..."
    sleep 2
    cp -f $TMPDIR/PIXELARITY/5277/migrate_legacy_obb_data.sh $TMPDIR/system/bin
    ui_print "  OBB fix applied"
  else
    ui_print " "
    ui_print "- OBB fix is already applied"
  fi
else
  ui_print " "
  ui_print "- OBB fix not applied"
fi
	
if [ -z $DTT ]; then
  if [ -z $VKSEL ]; then
    ui_print "- Some options not specified in zipname!"
    ui_print " "
    ui_print "- Using defaults if not specified in zipname!"
    [ -z $DTT ] && DTT=false
  else
    if [ -z $DTT ]; then
      ui_print " "
      ui_print "××××××××××××××××××××××××××××××××××××××××××××××××××××××"
      ui_print "×          DO YOU WANT TO DISABLE THERMALS?          ×"
      ui_print "××××××××××××××××××××××××××××××××××××××××××××××××××××××"
      ui_print "×                                                    ×"
      ui_print "×             [VOL+] = YES   [VOL-] = NO             ×"
      ui_print "×                                                    ×"
      ui_print "× Note: This can boost performance & charging speed  ×"
      ui_print "×       but can cause heating issues                 ×"
      ui_print "××××××××××××××××××××××××××××××××××××××××××××××××××××××"
      if $VKSEL; then
        DTT=true
      else
        DTT=false
      fi
    fi            
  fi                 
else
  ui_print "- Options specified in zipname!"
fi
  
if $DTT; then
  if [ -z $DTTC ]; then
    if [ -z $VKSEL ]; then
      ui_print "- Some options not specified in zipname!"
      ui_print " "
      ui_print "- Using defaults if not specified in zipname!"
      [ -z $DTTC ] && DTTC=false
    else
      if [ -z $DTTC ]; then
        ui_print " "         
        ui_print "××××××××××××××××××××××××××××××××××××××××××××××××××××××"
        ui_print "×              WARNING: HIGH RISK FEATURE            ×"
        ui_print "×            DO YOU STILL WANT TO CONTINUE?          ×"
        ui_print "××××××××××××××××××××××××××××××××××××××××××××××××××××××"
        ui_print "×                                                    ×"
        ui_print "×             [VOL+] = YES   [VOL-] = NO             ×"
        ui_print "×                                                    ×"
        ui_print "××××××××××××××××××××××××××××××××××××××××××××××××××××××"
        if $VKSEL; then
          DTTC=true
        else
          DTTC=false
        fi
      fi            
    fi                 
  else
  ui_print "- Options specified in zipname!"
  fi
  
  if $DTTC; then
    mkdir -p $TMPDIR/system
    cp -rf $TMPDIR/PIXELARITY/5277/Lamreht/vendor $TMPDIR/system
    ui_print " "
    ui_print "- Enjoy lag free performance and boosted charging speed"
  else
    ui_print " "
    ui_print "- Thermal disabling cancelled"
  fi
  
else
  ui_print " "
  ui_print "- Thermals NOT disabled"
fi
  
