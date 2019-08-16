#!/sbin/sh
# ADDOND_VERSION=2

#         ____  _            __           _ __                 
#       /  __ \_)   _____  / /___ ______(_) /___  __          
#      /  /_/ / / |/_/ _ \/ / __ '/ ___/ / __/ / / /          
#     / ____ / />   <| __/ / /_/ / /  / / /_/ /_/ /           
#    /_/    /_//_/|_/___/_/\__,_/_/ /_/\__/\__,  /            
#                            by Kyliekyler /____/             

. /tmp/backuptool.functions

ARG="$1"; P="$(dirname $C)"; MODID=

list_files() {
cat <<EOF
$(cat $P/addon.d/$MODID-files2)
EOF
}

case "$ARG" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $FILE
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$REPLACEMENT"
      [ -f "$C/$FILE" ] && restore_file $FILE $R
    done
  ;;
  pre-backup)
    cp -f $P/addon.d/$MODID-files $P/addon.d/$MODID-files2
    sed -i "s/NORESTORE//g" $P/addon.d/$MODID-files2
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    rm -f $P/addon.d/$MODID-files2
  ;;
esac
