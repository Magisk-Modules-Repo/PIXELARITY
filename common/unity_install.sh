##############################
#  PIXELARITY INSTALL LOGIC  #
#        by Kyliekyler       #
##############################

PIXELARITY=$(grep_prop ro.product.vendor.model /vendor/build.prop)
KYLIEKYLER=$(grep_prop ro.product.vendor.device /vendor/build.prop)

OIFS=$IFS; IFS=\|
case $(echo $(basename $ZIPFILE) | tr '[:upper:]' '[:lower:]') in
  *rcy*) RC=true;;
  *rcn*) RC=false;;
esac
case $(echo $(basename $ZIPFILE) | tr '[:upper:]' '[:lower:]') in
  *dtty*) DTT=true;;
  *dttn*) DTT=false;;
esac
case $(echo $(basename $ZIPFILE) | tr '[:upper:]' '[:lower:]') in
  *dttcy*) DTTC=true;;
  *dttcn*) DTTC=false;;
esac
case $(echo $(basename $ZIPFILE) | tr '[:upper:]' '[:lower:]') in
  *btal*) BTA=true;;
  *btad*) BTA=false;;
esac
IFS=$OIFS  

ui_print " "
ui_print "- Running API check..."
if [ $API -lt 29 ]; then
  sleep 1
  abort "  API level $API not supported, aborting..."
else
  sleep 1
  ui_print "  API level $API passed"
fi

ui_print " "
ui_print "- Running compatibility check..."
if [ -d /system/product/priv-app/SystemUIGoogle ]; then
  sleep 1
  ui_print "  Pixel GSI detected"
elif [ -d /system/product/priv-app/SystemUI ]; then
  sleep 1
  ui_print "  Generic GSI detected"
else
  sleep 1
  abort "  Not compatible, aborting..."
fi 
 
ui_print " "
ui_print "- Decompressing files..."
tar -xf $TMPDIR/PIXELARITY_KYLIEKYLER.tar.xz -C $TMPDIR 2>/dev/null
sleep 2
ui_print "  Decompressed successfully"

ui_print " "
ui_print "- Detecting device..."
sleep 3

case $KYLIEKYLER in
  whyred|jasmine_sprout|wayne)
    ui_print "  $PIXELARITY ($KYLIEKYLER) detected"
    ui_print " "
    if [ -z $RC ]; then
      if [ -z $VKSEL ]; then
       [ -z $RC ] && RC=true
      else
        if [ -z $RC ]; then
          ui_print "××××××××××××××××××××××××××××××××××××××××××××××××××××××"
          ui_print "×               CHOOSE WHAT TO INSTALL               ×"
          ui_print "××××××××××××××××××××××××××××××××××××××××××××××××××××××"
          ui_print "×                                                    ×"
          ui_print "×        [VOL+] = Device Default Style Corners       ×"
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
      ui_print " "
    fi
  
    mkdir -p $TMPDIR/system/vendor/overlay 

    if $RC; then
      if [ $KYLIEKYLER == "whyred" ]; then
        ui_print " "
        ui_print "- Device Default Style Corners selected"
        cp -f $TMPDIR/PIXELARITY/Whyred/Whyred/framework-res__auto_generated_rro.apk $TMPDIR/system/vendor/overlay
      elif [ $KYLIEKYLER == "wayne" ] || [ $KYLIEKYLER == "jasmine_sprout" ]; then
        ui_print " "
        ui_print "- Device Default Style Corners selected"
        cp -f $TMPDIR/PIXELARITY/Waymine/Waymine/framework-res__auto_generated_rro.apk $TMPDIR/system/vendor/overlay
      else 
        ui_print " "
      fi 
    else
      if [ $KYLIEKYLER == "whyred" ]; then
        ui_print " "
        ui_print "- Pixel Style Rounded Corners selected"
        cp -f $TMPDIR/PIXELARITY/Whyred/Pixel/framework-res__auto_generated_rro.apk $TMPDIR/system/vendor/overlay
        cp -f $TMPDIR/PIXELARITY/Whyred/Pixel/pixelarity_kyliekyler.apk $TMPDIR/system/vendor/overlay
      elif [ $KYLIEKYLER == "wayne" ] || [ $KYLIEKYLER == "jasmine_sprout" ]; then
        ui_print " "
        ui_print "- Pixel Style Rounded Corners selected"
        cp -f $TMPDIR/PIXELARITY/Waymine/Pixel/framework-res__auto_generated_rro.apk $TMPDIR/system/vendor/overlay
        cp -f $TMPDIR/PIXELARITY/Waymine/Pixel/pixelarity_kyliekyler.apk $TMPDIR/system/vendor/overlay
      else
        ui_print " "
      fi
    fi   
  
    if [ $KYLIEKYLER == "whyred" ]; then
      mkdir -p $TMPDIR/system/priv-app/QtiAudio
      cp -f $TMPDIR/PIXELARITY/Whyred/5277/CallFix/QtiAudio.apk $TMPDIR/system/priv-app/QtiAudio
      ui_print " "
      ui_print "- Checking kernel..."  
      if [ -e /vendor/etc/init/hw/init.kangaroox.rc ]; then
        ui_print "  KangarooX kernel detected"
        sleep 2
        mkdir -p $TMPDIR/system/vendor/etc
        ui_print " "
        ui_print "- Applying perf patch..."
        sleep 1
        cp -rf $TMPDIR/PIXELARITY/Whyred/5277/KernelLogFix/perf $TMPDIR/system/vendor/etc
        ui_print "  Perf patch applied"
        ui_print " "
      else
        sleep 1
        ui_print "  KangarooX kernel not detected, perf patch not needed"
        ui_print " "
      fi  
    else
      ui_print " "
    fi 
  ;;

  lavender|violet)
    mkdir -p $TMPDIR/system/vendor/overlay
    ui_print "  $PIXELARITY ($KYLIEKYLER) detected"
    cp -f $TMPDIR/PIXELARITY/Laviolet/Laviolet/framework-res__auto_generated_rro.apk $TMPDIR/system/vendor/overlay
    cp -f $TMPDIR/PIXELARITY/Laviolet/Laviolet/pixelarity_kyliekyler.apk $TMPDIR/system/vendor/overlay 
    ui_print " "
  ;;

  
  beryllium|sirius)
    mkdir -p $TMPDIR/system/product/overlay
    ui_print "  $PIXELARITY ($KYLIEKYLER) detected"
    ui_print " "
  ;;
  
  *)
    ui_print "  Detected device / build.prop is $PIXELARITY ($KYLIEKYLER)"
    abort "  Device not supported or using modified build.prop, aborting..."
  ;; 
esac

if [ -z $BTA ]; then
  if [ -z $VKSEL ]; then
    [ -z $BTA ] && BTA=true
  else
    if [ -z $DTT ]; then
      ui_print "××××××××××××××××××××××××××××××××××××××××××××××××××××××"
      ui_print "×     WHAT BOOTANIMATION DO YOU WANT TO INSTALL?     ×"
      ui_print "××××××××××××××××××××××××××××××××××××××××××××××××××××××"
      ui_print "×                                                    ×"
      ui_print "×            [VOL+] = Light Bootanimation            ×"
      ui_print "×                                                    ×"
      ui_print "×            [VOL-] = Dark Bootanimation             ×"
      ui_print "×                                                    ×"
      ui_print "××××××××××××××××××××××××××××××××××××××××××××××××××××××"
      if $VKSEL; then
        BTA=true
      else
        BTA=false
      fi
    fi            
  fi                 
else
  ui_print " "
fi  

if $BTA; then
  if $SYSTEM_ROOT; then
    mkdir -p $TMPDIR/system/product/media $TMPDIR/system_root/system/product/media
    ui_print " "
    ui_print "- Light Bootanimation selected"
    cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Thgil/bootanimation.zip $TMPDIR/system/product/media
    cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Thgil/bootanimation.zip $TMPDIR/system_root/system/product/media
  else
    mkdir -p $TMPDIR/system/product/media
    ui_print " "
    ui_print "- Light Bootanimation selected"
    cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Thgil/bootanimation.zip $TMPDIR/system/product/media
  fi
else
  if $SYSTEM_ROOT; then
    mkdir -p $TMPDIR/system/product/media $TMPDIR/system_root/system/product/media
    ui_print " "
    ui_print "- Dark Bootanimation selected"
    cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Krad/bootanimation.zip $TMPDIR/system/product/media
    cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Krad/bootanimation.zip $TMPDIR/system_root/system/product/media
  else
    mkdir -p $TMPDIR/system/product/media
    ui_print " "
    ui_print "- Dark Bootanimation selected"
    cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Krad/bootanimation.zip $TMPDIR/system/product/media
  fi
fi   

if [ -z $DTT ]; then
  if [ -z $VKSEL ]; then
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
  ui_print " "
fi  

if $DTT; then
  if [ -z $DTTC ]; then
    if [ -z $VKSEL ]; then
      [ -z $DTTC ] && DTTC=false
    else
      if [ -z $DTTC ]; then
        ui_print " "    
        ui_print "- Initiating..."
        sleep 2
        ui_print " "   
        ui_print "××××××××××××××××××××××××××××××××××××××××××××××××××××××"
        ui_print "×            DO YOU STILL WANT TO CONTINUE?          ×"
        ui_print "××××××××××××××××××××××××××××××××××××××××××××××××××××××"
        ui_print "×                                                    ×"
        ui_print "×             [VOL+] = YES   [VOL-] = NO             ×"
        ui_print "×                                                    ×"
        ui_print "× Warning: High Risk Feature, continue at your own   ×"
        ui_print "×          risk!                                     ×"
        ui_print "××××××××××××××××××××××××××××××××××××××××××××××××××××××"
        if $VKSEL; then
          DTTC=true
        else
          DTTC=false
        fi
      fi            
    fi                 
  else
  ui_print " "
  fi  
  
  mkdir -p $TMPDIR/system/vendor
  
  if $DTTC; then
    ui_print " "
    ui_print "- Disabling thermals..."
    sleep 2
    case $KYLIEKYLER in
      whyred)
        cp -rf $TMPDIR/PIXELARITY/5277/Thermals/bin $TMPDIR/system/vendor
        cp -rf $TMPDIR/PIXELARITY/5277/Thermals/etc $TMPDIR/system/vendor
        ui_print "  Thermals disabled for $PIXELARITY ($KYLIEKYLER)"
        ui_print " "
        ui_print "- Enjoy lag free performance and boosted charging speed"
      ;;
      
      *)
        cp -rf $TMPDIR/PIXELARITY/5277/Thermals/etc $TMPDIR/system/vendor
        ui_print "  Thermals disabled for $PIXELARITY ($KYLIEKYLER)"
        ui_print " "
        ui_print "- Enjoy lag free performance and boosted charging speed"
      ;;
    esac
  else
    ui_print " "
    ui_print "- Thermal disabling cancelled"
  fi  
else
  ui_print " "
  ui_print "- Thermals NOT disabled"
fi
