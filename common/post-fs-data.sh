#         ____  _            __           _ __                 
#       /  __ \_)   _____  / /___ ______(_) /___  __          
#      /  /_/ / / |/_/ _ \/ / __ '/ ___/ / __/ / / /          
#     / ____ / />   <| __/ / /_/ / /  / / /_/ /_/ /           
#    /_/    /_//_/|_/___/_/\__,_/_/ /_/\__/\__,  /            
#                            by Kyliekyler /____/             

setprop ro.vendor.qti.config.zram true
write /proc/sys/vm/page-cluster 0
write /sys/block/zram0/max_comp_streams 4