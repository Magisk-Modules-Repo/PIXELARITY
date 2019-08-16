#         ____ _            __           _ __                 
#       /  __ \_)   _____  / /___ ______(_) /___  __          
#      /  /_/ / / |/_/ _ \/ / __ '/ ___/ / __/ / / /          
#     / ____ / />   <| __/ / /_/ / /  / / /_/ /_/ /           
#    /_/    /_××_/|_/___/_/\__,_/_/ /_/\__/\__,  /            
#                            by Kyliekyler /____/             

OIFS×$IFS; IFS×\|
case $(echo $(basename $ZIPFILE) | tr '[:upper:]' '[:lower:]') in
  *ovld*) OVL=default;;
  *ovlp*) OVL=pixel;;
  *btad*) BTA=default;;
  *btap*) BTA=pixel;;
  *btacl*) BTAC=light;;
  *btacd*) BTAC=dark;;
  *moded*) MODE=default;;
  *modeg*) MODE=game;;
  *gmcc*) GMC=cont;;
  *gmca*) GMC=abrt;;
esac
IFS×$OIFS
 
ui_print " "
ui_print "- Decompressing files..."
tar -xf $TMPDIR/PIXELARITY_KYLIEKYLER.tar.xz -C $TMPDIR 2>/dev/null
sleep 1
ui_print "  Decompressed successfully"

# OVERLAYS IS HERE ≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈//
case $API in
  29)  
    mkdir -p $TMPDIR/system/app $TMPDIR/system/vendor/overlay $TMPDIR/system/product/overlay      
    cp -rf $TMPDIR/PIXELARITY/Q/5277/EasterEgg $TMPDIR/system/app
    
    # NO NOTCH Q IS HERE ≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈//
    case $KYLIEKYLER in
      wayne|jasmine*|whyred|mido|tissot)
        if [ -z $OVL ]; then
          if [ -z $VKSEL ]; then
           [ -z $OVL ] && OVL=default
          else
            if [ -z $OVL ]; then
              ui_print " "
              ui_print "××××××××××××××××××××××××××××××××××××××××××××××"
              ui_print "×               CHOOSE OVERLAY               ×"
              ui_print "××××××××××××××××××××××××××××××××××××××××××××××"
              ui_print "×                                            ×"
              ui_print "×   [VOL+] = Device Default Style Corners    ×"
              ui_print "×                                            ×"
              ui_print "×   [VOL-] = Pixel Style Rounded Corners     ×"
              ui_print "×                                            ×"
              ui_print "××××××××××××××××××××××××××××××××××××××××××××××"
              if $VKSEL; then
                OVL=default
              else
                OVL=pixel
              fi
            fi            
          fi                 
        fi

        case $OVL in 
          default)
            ui_print " "
            ui_print "- Device Default Style Corners selected"
            ui_print " "
            cp -f $TMPDIR/PIXELARITY/Q/Generic/NoNotch/Default/framework-res__auto_generated_rro.apk $TMPDIR/system/vendor/overlay
          ;;
          
          pixel)
            ui_print " "
            ui_print "- Pixel Style Rounded Corners selected"
            ui_print " "
            cp -f $TMPDIR/PIXELARITY/Q/Generic/NoNotch/Pixel/framework-res__auto_generated_rro.apk $TMPDIR/system/vendor/overlay
            cp -f $TMPDIR/PIXELARITY/Q/Generic/NoNotch/Pixel/kyliekyler.apk $TMPDIR/system/vendor/overlay
          ;;
        esac
      ;;
      
      # NOTCH Q IS HERE ≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈//
      beryllium|polaris|grus|sirius)
        if [ -d /system/vendor/overlay/ChinaMobileFrameworksRes ]; then
          cp -f $TMPDIR/PIXELARITY/Q/Generic/Notch/Regular/pixelarity.apk $TMPDIR/system/product/overlay
          cp -f $TMPDIR/PIXELARITY/Q/Generic/Notch/Regular/kyliekyler.apk $TMPDIR/system/product/overlay        
          ui_print " "
        else
          cp -f $TMPDIR/PIXELARITY/Q/Generic/Notch/Regular/pixelarity.apk $TMPDIR/system/vendor/overlay
          cp -f $TMPDIR/PIXELARITY/Q/Generic/Notch/Regular/kyliekyler.apk $TMPDIR/system/vendor /overlay        
          ui_print " "
        fi
      ;;    
          
      lavender|violet)
        cp -f $TMPDIR/PIXELARITY/Q/Generic/Notch/Waterdrop/framework-res__auto_generated_rro.apk $TMPDIR/system/vendor/overlay
        cp -f $TMPDIR/PIXELARITY/Q/Generic/Notch/Waterdrop/kyliekyler.apk $TMPDIR/system/vendor/overlay 
        ui_print " "
      ;;
         
      # ELSE Q IS HERE ≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈//
      *)
        ui_print " "
      ;;
    esac
  ;;
  
  28)
    mkdir -p $TMPDIR/system/vendor/overlay   
    case $CHINNY in
      true)
        case $KYLIEKYLER in    
          # NO NOTCH P IS HERE ×××≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈//
          whyred|wayne|jasmine*|mido|tissot)
            if [ -z $OVL ]; then
              if [ -z $VKSEL ]; then
               [ -z $OVL ] && OVL=default
              else
                if [ -z $OVL ]; then
                  ui_print " "
                  ui_print "××××××××××××××××××××××××××××××××××××××××××××××"
                  ui_print "×               CHOOSE OVERLAY               ×"
                  ui_print "××××××××××××××××××××××××××××××××××××××××××××××"
                  ui_print "×                                            ×"
                  ui_print "×   [VOL+] = Device Default Style Corners    ×"
                  ui_print "×                                            ×"
                  ui_print "×   [VOL-] = Pixel Style Rounded Corners     ×"
                  ui_print "×                                            ×"
                  ui_print "××××××××××××××××××××××××××××××××××××××××××××××"
                  if $VKSEL; then
                    OVL=default
                  else
                    OVL=pixel
                  fi
                fi            
              fi                 
            fi
  
            case $OVL in 
              default) 
                ui_print " "
                ui_print "- Device Default Style Corners selected"
                ui_print " "
                cp -f $TMPDIR/PIXELARITY/P/Generic/NoNotch/Default/framework-res__auto_generated_rro.apk $TMPDIR/system/vendor/overlay
              ;;
          
              pixel)
                ui_print " "
                ui_print "- Pixel Style Rounded Corners selected"
                ui_print " "
                cp -f $TMPDIR/PIXELARITY/P/Generic/NoNotch/Pixel/framework-res__auto_generated_rro.apk $TMPDIR/system/vendor/overlay
                cp -f $TMPDIR/PIXELARITY/P/Generic/NoNotch/Pixel/kyliekyler.apk $TMPDIR/system/vendor/overlay
              ;;
            esac  
          ;;   
      
          # ELSE IS HERE ≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈//
          *)
            ui_print " "
          ;; 
        esac   
      ;;
    esac
  ;;
esac
    
# DEVICE SPECIFIC TWEAKS / FIX IS HERE ≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈//
case $KYLIEKYLER in
  whyred|wayne|tulip)
    if [ -e /vendor/etc/init/hw/init.kangaroox.rc ]; then
      mkdir -p $TMPDIR/system/vendor/etc
      cp -rf $TMPDIR/PIXELARITY/5277/KernelLogFix/perf $TMPDIR/system/vendor/etc
    fi
  ;;
esac

case $KYLIEKYLER in
  whyred)
    if [ -d /system/priv-app/phh ]; then
      mkdir -p $TMPDIR/system/priv-app/QtiAudio
      cp -f $TMPDIR/PIXELARITY/Q/Whyred/5277/CallFix/QtiAudio.apk $TMPDIR/system/priv-app/QtiAudio
    fi
  ;;
esac

case $KYLIEKYLER in
  lavender)
    case $API in
      28)
        if [ -e /system/framework/qti-telephony-common.jar ]; then
          rm -f /system/framework/qti-telephony-common.jar
        fi
      ;;
    esac
  ;;
esac
  
# BOOTANIMATION IS HERE ≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈//
if [ -z $BTA ]; then
  if [ -z $VKSEL ]; then
    [ -z $BTA ] && BTA=default
  else
    if [ -z $BTA ]; then
      sleep 1
      ui_print "××××××××××××××××××××××××××××××××××××××××××××××"
      ui_print "×            CHOOSE BOOTANIMATION            ×"
      ui_print "××××××××××××××××××××××××××××××××××××××××××××××"
      ui_print "×                                            ×"
      ui_print "×   [VOL+] = Device Default Bootanimation    ×"
      ui_print "×                                            ×"
      ui_print "×   [VOL-] = Pixel Style Bootanimation       ×"
      ui_print "×                                            ×"
      ui_print "××××××××××××××××××××××××××××××××××××××××××××××"
      if $VKSEL; then
        BTA=default
      else
        BTA=pixel
      fi
    fi            
  fi                 
fi

case $BTA in
  default)
    ui_print " "
    ui_print "- Device Default Bootanimation selected"
  ;;
  
  pixel)
    ui_print " "
    ui_print "- Pixel Style Bootanimation selected"
    if [ -z $BTAC ]; then
      if [ -z $VKSEL ]; then
        [ -z $BTAC ] && BTAC=light
      else
        if [ -z $BTAC ]; then
          sleep 1
          ui_print " "
          ui_print "××××××××××××××××××××××××××××××××××××××××××××××"
          ui_print "×         CHOOSE BOOTANIMATION THEME         ×"
          ui_print "××××××××××××××××××××××××××××××××××××××××××××××"
          ui_print "×                                            ×"
          ui_print "×       [VOL+] = Light Bootanimation         ×"
          ui_print "×                                            ×"
          ui_print "×       [VOL-] = Dark Bootanimation          ×"
          ui_print "×                                            ×"
          ui_print "××××××××××××××××××××××××××××××××××××××××××××××"
          if $VKSEL; then
            BTAC=light
          else
            BTAC=dark
          fi
        fi            
      fi                 
    fi 

    case $BTAC in
      # LIGHT BOOTANIMATION IS HERE ≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈//
      light)
        case $API in
          29)
            case $SYSTEM_ROOT in
              true)
                case $KYLIEKYLER in
                  last_resort)
                    ui_print " "
                    ui_print "- Changing bootanimation of $KYLIEKYLER on Q not possible"
                  ;;
                  
                  *)
                    mkdir -p $TMPDIR/system/product/media $TMPDIR/system_root/system/product/media
                    ui_print " "
                    ui_print "- Light Bootanimation selected"
                    cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Thgil/bootanimation.zip $TMPDIR/system/product/media
                    cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Thgil/bootanimation.zip $TMPDIR/system_root/system/product/media
                  ;;
                esac
              ;;
 
              false)
                mkdir -p $TMPDIR/system/product/media
                ui_print " "
                ui_print "- Light Bootanimation selected"
                cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Thgil/bootanimation.zip $TMPDIR/system/product/media
              ;;
            esac
          ;;
      
          28) 
            case $SYSTEM_ROOT in
              true)  
                mkdir -p $TMPDIR/system/media $TMPDIR/system_root/system/media
                ui_print " "
                ui_print "- Light Bootanimation selected"
                cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Thgil/bootanimation.zip $TMPDIR/system/media
                cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Thgil/bootanimation.zip $TMPDIR/system_root/system/media
              ;;
 
              false)
                mkdir -p $TMPDIR/system/media
                ui_print " "
                ui_print "- Light Bootanimation selected"
                cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Thgil/bootanimation.zip $TMPDIR/system/media
              ;;
            esac
          ;;
        esac     
      ;;
     
      # DARK BOOTANIMATION IS HERE ≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈// 
      dark)
        case $API in
          29)
            case $SYSTEM_ROOT in
              true)  
                case $KYLIEKYLER in
                  last_resort)
                    ui_print " "
                    ui_print "- Changing bootanimation of $KYLIEKYLER on Q not possible"
                  ;;
                  
                  *)
                    mkdir -p $TMPDIR/system/product/media $TMPDIR/system_root/system/product/media
                    ui_print " "
                    ui_print "- Dark Bootanimation selected"
                    cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Krad/bootanimation.zip $TMPDIR/system/product/media
                    cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Krad/bootanimation.zip $TMPDIR/system_root/system/product/media
                  ;;
                esac
              ;;
 
              false)
                mkdir -p $TMPDIR/system/product/media
                ui_print " "
                ui_print "- Dark Bootanimation selected"
                cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Krad/bootanimation.zip $TMPDIR/system/product/media
              ;;
            esac
          ;;
    
          28)
            case $SYSTEM_ROOT in
              true)  
                mkdir -p $TMPDIR/system/media $TMPDIR/system_root/system/media
                ui_print " "
                ui_print "- Dark Bootanimation selected"
                cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Krad/bootanimation.zip $TMPDIR/system/media
                cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Krad/bootanimation.zip $TMPDIR/system_root/system/media
              ;;
 
              false)
                mkdir -p $TMPDIR/system/media
                ui_print " "
                ui_print "- Dark Bootanimation selected"
                cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Krad/bootanimation.zip $TMPDIR/system/media
              ;;
            esac
          ;;
        esac
      ;;
    esac
  ;;
esac

# MODES IS HERE ≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈//
if [ -z $MODE ]; then
  if [ -z $VKSEL ]; then
    [ -z $MODE ] && MODE=default
  else
    if [ -z $MODE ]; then
      sleep 1
      ui_print " "
      ui_print "××××××××××××××××××××××××××××××××××××××××××××××"
      ui_print "×                CHOOSE MODE                 ×"
      ui_print "××××××××××××××××××××××××××××××××××××××××××××××"
      ui_print "×                                            ×"
      ui_print "×           [VOL+] = DEFAULT MODE            ×"
      ui_print "×                                            ×"
      ui_print "×           [VOL-] = GAMING MODE             ×"
      ui_print "×                                            ×"
      ui_print "××××××××××××××××××××××××××××××××××××××××××××××"    
      if $VKSEL; then
        MODE=default
      else
        MODE=game
      fi
    fi            
  fi                 
fi  

case $MODE in
  # DEFAULT MODE IS HERE ≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈//
  default)
    ui_print " "
    ui_print "- DEFAULT MODE selected"
  ;;
  
  # GAMING MODE IS HERE ≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈//
  game)
    if [ -z $GMC ]; then
      if [ -z $VKSEL ]; then
        [ -z $GMC ] && GMC=abrt
      else
        if [ -z $GMC ]; then
          ui_print " "    
          ui_print "- GAMING MODE selected"
          sleep 1
          ui_print " " 
          ui_print "××××××××××××××××××××××××××××××××××××××××××××××"
          ui_print "×           GAMING MODE CONFIRMATION         ×"
          ui_print "××××××××××××××××××××××××××××××××××××××××××××××"
          ui_print "×                                            ×"
          ui_print "×     [VOL+] = CONTINUE   [VOL-] = ABORT     ×"
          ui_print "×                                            ×"
          ui_print "× Note: This will significantly improves     ×"
          ui_print "×       overall performance but will cause   ×"
          ui_print "×       heating & increased power usage.     ×"
          ui_print "××××××××××××××××××××××××××××××××××××××××××××××"
          if $VKSEL; then
            GMC=cont
          else
            GMC=abrt
          fi
        fi            
      fi                 
    fi 
   
    case $GMC in
      cont)
        ui_print " "
        ui_print "- Enabling GAMING MODE..."
        case $KYLIEKYLER in
          *)
            sleep 1
            mkdir -p $TMPDIR/system/vendor $TMPDIR/system/lib $TMPDIR/system/lib64
            cp -rf $TMPDIR/PIXELARITY/5277/G/A/M/I/N/G/-/M/O/D/E/-/T/H/E/R/M/A/L/S/bin $TMPDIR/system/vendor
            cp -rf $TMPDIR/PIXELARITY/5277/G/A/M/I/N/G/-/M/O/D/E/-/T/H/E/R/M/A/L/S/etc $TMPDIR/system/vendor
            cp -rf $TMPDIR/PIXELARITY/5277/G/A/M/I/N/G/-/M/O/D/E/-/L/I/B/6/4/egl $TMPDIR/system/lib64
            cp -rf $TMPDIR/PIXELARITY/5277/G/A/M/I/N/G/-/M/O/D/E/-/L/I/B/egl $TMPDIR/system/lib
            ui_print "  GAMING MODE ENABLED, UNLEASH THE POWER!" 
          ;;    
        esac
      ;;
      
      abrt)
        ui_print " "
        ui_print "- Aborted GAMING MODE, setting back DEFAULTS"
      ;;
    esac 
  ;;
esac

ui_print " "
ui_print "- Wiping dalvik-cache..."
sleep 1
rm -rf /data/dalvik-cache
ui_print "  Next boot will be a bit longer to boot"

 