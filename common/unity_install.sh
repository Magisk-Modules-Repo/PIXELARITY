#         ____ _            __           _ __                 
#       /  __ \_)   _____  / /___ ______(_) /___  __          
#      /  /_/ / / |/_/ _ \/ / __ '/ ___/ / __/ / / /          
#     / ____ / />   <| __/ / /_/ / /  / / /_/ /_/ /           
#    /_/    /_/__/|_/___/_/\__,_/_/ /_/\__/\__,  /            
#                            by Kyliekyler /____/             

OIFS=$IFS; IFS=\|
case $(echo $(basename $ZIPFILE) | tr '[:upper:]' '[:lower:]') in
  *ovld*) OVL=default;;
  *ovlp*) OVL=pixel;;
  *btad*) BTA=default;;
  *btap*) BTA=pixel;;
  *btacl*) BTAC=light;;
  *btacd*) BTAC=dark;;
  *fontd*) FONT=default;;
  *fontg*) FONT=googlesans;;
esac
IFS=$OIFS
 
ui_print " "
ui_print "- Decompressing files..."
tar -xf $TMPDIR/PIXELARITY_KYLIEKYLER.tar.xz -C $TMPDIR 2>/dev/null
sleep 1
ui_print "  Decompressed successfully"

# DEVICE RESTRICTIONS IS HERE =============================================//
case $KYLIEKYLER in
  sailfish|marlin|walleye|taimen|blueline|crosshatch|sargo|bonito)
    ui_print " "
    abort "- Sorry $(echo $PIXELARITY | tr a-z A-Z) ($(echo $KYLIEKYLER | tr a-z A-Z)) not supported, aborting..."
  ;;
esac

case $(echo $HUANGSUNG | tr '[:upper:]' '[:lower:]') in
  samsung|huawei)
    ui_print " "
    abort "- $(echo $HUANGSUNG | tr a-z A-Z) not supported, aborting..."
  ;;
esac

# OVERLAYS IS HERE ========================================================//
case $API in
  29)  
    mkdir -p $TMPDIR/system $TMPDIR/system/vendor/overlay $TMPDIR/system/product/overlay $TMPDIR/system/vendor/app
    cp -rf $TMPDIR/PIXELARITY/10/5277/priv-app $TMPDIR/system
    
    # NO NOTCH 10 IS HERE ==================================================//
    case $KYLIEKYLER in
      wayne|jasmine*|whyred|mido|tissot)
        if [ -z $OVL ]; then
          if [ -z $VKSEL ]; then
           [ -z $OVL ] && OVL=default
          else
            if [ -z $OVL ]; then
              ui_print " "
              ui_print "×××××××××××××××××××××××××××××××××××××××××××××××"
              ui_print "×                CHOOSE OVERLAY               ×"
              ui_print "×××××××××××××××××××××××××××××××××××××××××××××××"
              ui_print "×                                             ×"
              ui_print "×    [VOL+] = Device Default Style Corners    ×"
              ui_print "×                                             ×"
              ui_print "×    [VOL-] = Pixel Style Rounded Corners     ×"
              ui_print "×                                             ×"
              ui_print "×××××××××××××××××××××××××××××××××××××××××××××××"
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
            cp -f $TMPDIR/PIXELARITY/10/Generic/NoNotch/Default/framework-res__auto_generated_rro.apk $TMPDIR/system/vendor/overlay
          ;;
          
          pixel)
            ui_print " "
            ui_print "- Pixel Style Rounded Corners selected"
            ui_print " "
            cp -f $TMPDIR/PIXELARITY/10/Generic/NoNotch/Pixel/framework-res__auto_generated_rro.apk $TMPDIR/system/vendor/overlay
            cp -f $TMPDIR/PIXELARITY/10/Generic/NoNotch/Pixel/kyliekyler.apk $TMPDIR/system/vendor/overlay
          ;;
        esac
      ;;
      
      # NOTCH 10 IS HERE ===================================================//
      beryllium)
        cp -f $TMPDIR/PIXELARITY/10/Generic/Generic/pixelarity.apk $TMPDIR/system/product/overlay
        cp -f $TMPDIR/PIXELARITY/10/Beryllium/Beryllium/pixelarityds.apk $TMPDIR/system/product/overlay
        cp -f $TMPDIR/PIXELARITY/10/Beryllium/Beryllium/kyliekyler.apk $TMPDIR/system/product/overlay        
        ui_print " "
      ;;

      sirius)
        if [ -z $OVL ]; then
          if [ -z $VKSEL ]; then
           [ -z $OVL ] && OVL=default
          else
            if [ -z $OVL ]; then
              ui_print " "
              ui_print "×××××××××××××××××××××××××××××××××××××××××××××××"
              ui_print "×                CHOOSE OVERLAY               ×"
              ui_print "×××××××××××××××××××××××××××××××××××××××××××××××"
              ui_print "×                                             ×"
              ui_print "×    [VOL+] = Device Default Style Corners    ×"
              ui_print "×                                             ×"
              ui_print "×    [VOL-] = Pixel Style Rounded Corners     ×"
              ui_print "×                                             ×"
              ui_print "×××××××××××××××××××××××××××××××××××××××××××××××"
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
            cp -f $TMPDIR/PIXELARITY/10/Generic/Generic/pixelarity.apk $TMPDIR/system/product/overlay
            cp -f $TMPDIR/PIXELARITY/10/Sirius/Sirius/Default/pixelarityds.apk $TMPDIR/system/product/overlay
            cp -f $TMPDIR/PIXELARITY/10/Sirius/Sirius/Default/kyliekyler.apk $TMPDIR/system/product/overlay 
            cp -f $TMPDIR/PIXELARITY/10/Sirius/Sirius/Default/pixelarity_kyliekyler.apk $TMPDIR/system/product/overlay
          ;;
          
          pixel)
            ui_print " "
            ui_print "- Pixel Style Rounded Corners selected"
            ui_print " "
            cp -f $TMPDIR/PIXELARITY/10/Generic/Generic/pixelarity.apk $TMPDIR/system/product/overlay
            cp -f $TMPDIR/PIXELARITY/10/Sirius/Sirius/Pixel/pixelarityds.apk $TMPDIR/system/product/overlay
            cp -f $TMPDIR/PIXELARITY/10/Sirius/Sirius/Pixel/kyliekyler.apk $TMPDIR/system/product/overlay    
            cp -f $TMPDIR/PIXELARITY/10/Sirius/Sirius/Pixel/pixelarity_kyliekyler.apk $TMPDIR/system/product/overlay
          ;;  
        esac
      ;;
    
      lavender|violet|grus)
        if [ -d /system/vendor/overlay/ChinaMobileFrameworksRes ]; then
          cp -f $TMPDIR/PIXELARITY/10/Generic/Notch/Waterdrop/framework-res__auto_generated_rro.apk $TMPDIR/system/product/overlay
          cp -f $TMPDIR/PIXELARITY/10/Generic/Notch/Waterdrop/kyliekyler.apk $TMPDIR/system/product/overlay 
          ui_print " "
        else
          cp -f $TMPDIR/PIXELARITY/10/Generic/Notch/Waterdrop/framework-res__auto_generated_rro.apk $TMPDIR/system/vendor/overlay
          cp -f $TMPDIR/PIXELARITY/10/Generic/Notch/Waterdrop/kyliekyler.apk $TMPDIR/system/vendor/overlay 
          ui_print " "
        fi
      ;;
         
      # GENERIC 10 IS HERE =================================================//
      *)
        if [ -d /system/vendor/overlay/ChinaMobileFrameworksRes ]; then
          cp -f $TMPDIR/PIXELARITY/10/Generic/Generic/pixelarity.apk $TMPDIR/system/product/overlay
          cp -f $TMPDIR/PIXELARITY/10/Generic/Generic/kyliekyler.apk $TMPDIR/system/product/overlay
          ui_print " "
        else
          cp -f $TMPDIR/PIXELARITY/10/Generic/Generic/pixelarity.apk $TMPDIR/system/vendor/overlay
          cp -f $TMPDIR/PIXELARITY/10/Generic/Generic/kyliekyler.apk $TMPDIR/system/vendor/overlay
          ui_print " "
        fi
      ;;
    esac
  ;;
  
  28)
    mkdir -p $TMPDIR/system/vendor/overlay
    cp -f $TMPDIR/PIXELARITY/9/5277/AODEnabler/pixelarity.apk $TMPDIR/system/vendor/overlay
    ui_print " "
  ;;
esac

# FONTS IS HERE ===========================================================//  
if [ -z $FONT ]; then
  if [ -z $VKSEL ]; then
    [ -z $FONT ] && FONT=default
  else
    if [ -z $FONT ]; then
      sleep 1
      ui_print "×××××××××××××××××××××××××××××××××××××××××××××××"
      ui_print "×                 CHOOSE FONT                 ×"
      ui_print "×××××××××××××××××××××××××××××××××××××××××××××××"
      ui_print "×                                             ×"
      ui_print "×        [VOL+] = System Default Font         ×"
      ui_print "×                                             ×"
      ui_print "×        [VOL-] = Google Sans Font            ×"
      ui_print "×                                             ×"
      ui_print "×××××××××××××××××××××××××××××××××××××××××××××××"
      if $VKSEL; then
        FONT=default
      else
        FONT=googlesans
      fi
    fi            
  fi                 
fi

case $FONT in
  default)
    ui_print " "
    ui_print "- System Default Font selected"
  ;;
 
  googlesans)
    mkdir -p $TMPDIR/system
    ui_print " "
    ui_print "- Google Sans Font selected"
    cp -rf $TMPDIR/PIXELARITY/5277/GoogleSans/fonts $TMPDIR/system
  ;;
esac
    
# DEVICE SPECIFIC TWEAKS / FIX IS HERE ====================================//
case $KYLIEKYLER in
  whyred|wayne|tulip)
    if [ -e "/vendor/etc/init/hw/init.kangaroox.rc" ]; then
      mkdir -p $TMPDIR/system/vendor/etc
      cp -rf $TMPDIR/PIXELARITY/5277/KernelLogFix/perf $TMPDIR/system/vendor/etc
    fi
  ;;
esac

case $KYLIEKYLER in
  whyred)
    if [ -d "/system/priv-app/phh" ]; then
      mkdir -p $TMPDIR/system/priv-app/QtiAudio
      cp -f $TMPDIR/PIXELARITY/10/Whyred/5277/CallFix/QtiAudio.apk $TMPDIR/system/priv-app/10tiAudio
    fi
  ;;
esac

case $KYLIEKYLER in
  lavender|violet)
    case $API in
      28)
        if [ -e "/system/framework/qti-telephony-common.jar" ]; then
          rm -rf /system/framework/qti-telephony-common.jar
        fi
      ;;
    esac
  ;;
esac 

case $KYLIEKYLER in
  sirius)
    case $API in
      29)
        mkdir -p $TMPDIR/system/vendor/lib
        cp -rf $TMPDIR/PIXELARITY/10/Sirius/5277/CameraFix/hw $TMPDIR/system/vendor/lib
      ;;
    esac
  ;;
esac
  
# BOOTANIMATION IS HERE ===================================================//
case $KYLIEKYLER in
  # UNCHANGABLE/INCOMPATIBLE IS HERE ======================================//
  lavender|violet|*H850*)
    ui_print " "
  ;;
  
  # COMPATIBLE IS HERE ====================================================//
  *)
    if [ -z $BTA ]; then
      if [ -z $VKSEL ]; then
        [ -z $BTA ] && BTA=default
      else
        if [ -z $BTA ]; then
          ui_print " "
          sleep 1
          ui_print "×××××××××××××××××××××××××××××××××××××××××××××××"
          ui_print "×             CHOOSE BOOTANIMATION            ×"
          ui_print "×××××××××××××××××××××××××××××××××××××××××××××××"
          ui_print "×                                             ×"
          ui_print "×    [VOL+] = Device Default Bootanimation    ×"
          ui_print "×                                             ×"
          ui_print "×    [VOL-] = Pixel Style Bootanimation       ×"
          ui_print "×                                             ×"
          ui_print "×××××××××××××××××××××××××××××××××××××××××××××××"
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
              ui_print "×××××××××××××××××××××××××××××××××××××××××××××××"
              ui_print "×         CHOOSE BOOTANIMATION THEME          ×"
              ui_print "×××××××××××××××××××××××××××××××××××××××××××××××"
              ui_print "×                                             ×"
              ui_print "×        [VOL+] = Light Bootanimation         ×"
              ui_print "×                                             ×"
              ui_print "×        [VOL-] = Dark Bootanimation          ×"
              ui_print "×                                             ×"
              ui_print "×××××××××××××××××××××××××××××××××××××××××××××××"
              if $VKSEL; then
                BTAC=light
              else
                BTAC=dark
              fi
            fi            
          fi                 
        fi 

        case $BTAC in
          # LIGHT BOOTANIMATION IS HERE =======================================//
          light)
            case $API in
              29)
                case $SYSTEM_ROOT in
                  true)
                    mkdir -p $TMPDIR/system/product/media $TMPDIR/system_root/system/product/media
                    ui_print " "
                    ui_print "- Light Bootanimation selected"
                    cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Generic/Thgil/bootanimation.zip $TMPDIR/system/product/media
                    cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Generic/Thgil/bootanimation.zip $TMPDIR/system_root/system/product/media
                  ;;
         
                  false)
                    mkdir -p $TMPDIR/system/product/media
                    ui_print " "
                    ui_print "- Light Bootanimation selected"
                    cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Generic/Thgil/bootanimation.zip $TMPDIR/system/product/media
                  ;;
                esac
              ;;
      
              28) 
                case $SYSTEM_ROOT in
                  true)                     
                    mkdir -p $TMPDIR/system/media $TMPDIR/system_root/system/media
                    ui_print " "
                    ui_print "- Light Bootanimation selected"
                    cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Generic/Thgil/bootanimation.zip $TMPDIR/system/media
                    cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Generic/Thgil/bootanimation.zip $TMPDIR/system_root/system/media
                  ;;
 
                  false)                    
                    mkdir -p $TMPDIR/system/media
                    ui_print " "
                    ui_print "- Light Bootanimation selected"
                    cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Generic/Thgil/bootanimation.zip $TMPDIR/system/media
                  ;;
                esac
              ;;
            esac     
          ;;
     
          # DARK BOOTANIMATION IS HERE ========================================// 
          dark)
            case $API in
              29)
                case $SYSTEM_ROOT in
                  true)
                    mkdir -p $TMPDIR/system/product/media $TMPDIR/system_root/system/product/media
                    ui_print " "
                    ui_print "- Dark Bootanimation selected"
                    cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Generic/Krad/bootanimation.zip $TMPDIR/system/product/media
                    cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Generic/Krad/bootanimation.zip $TMPDIR/system_root/system/product/media
                  ;;
         
                  false)
                    mkdir -p $TMPDIR/system/product/media
                    ui_print " "
                    ui_print "- Dark Bootanimation selected"
                    cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Generic/Krad/bootanimation.zip $TMPDIR/system/product/media
                  ;;
                esac
              ;;
      
              28) 
                case $SYSTEM_ROOT in
                  true)  
                    mkdir -p $TMPDIR/system/media $TMPDIR/system_root/system/media
                    ui_print " "
                    ui_print "- Dark Bootanimation selected"
                    cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Generic/Krad/bootanimation.zip $TMPDIR/system/media
                    cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Generic/Krad/bootanimation.zip $TMPDIR/system_root/system/media
                  ;;
 
                  false)
                    mkdir -p $TMPDIR/system/media
                    ui_print " "
                    ui_print "- Dark Bootanimation selected"
                    cp -f $TMPDIR/PIXELARITY/5277/Bootanimation/Generic/Krad/bootanimation.zip $TMPDIR/system/media
                  ;;
                esac
              ;;
            esac
          ;;
        esac
      ;;
    esac
  ;;
esac
