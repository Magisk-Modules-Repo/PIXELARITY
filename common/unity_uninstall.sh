#         ____ _            __           _ __                 
#       /  __ \_)   _____  / /___ ______(_) /___  __          
#      /  /_/ / / |/_/ _ \/ / __ '/ ___/ / __/ / / /          
#     / ____ / />   <| __/ / /_/ / /  / / /_/ /_/ /           
#    /_/    /_/__/|_/___/_/\__,_/_/ /_/\__/\__,  /            
#                            by Kyliekyler /____/      

ui_print " "
ui_print "- Removing module remnants..."

if $MAGISK; then
  magiskpolicy --live "create system_server sdcardfs file" "allow system_server sdcardfs file { write }"
fi

if [ -e /data/adb/modules/PIXELARITY ]; then
  rm -rf /data/adb/modules/PIXELARITY
fi

case $API in
  29)
    rm -rf /data/resource-cache
  ;;
 
  *)
    rm -f /data/resource-cache/overlays.list
    rm -rf /data/resource-cache
  ;;
esac

rm -rf /data/dalvik-cache

ui_print "  Done, next boot will be a little bit longer"