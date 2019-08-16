#!/system/bin/sh

#         ____ _            __           _ __                 
#       /  __ \_)   _____  / /___ ______(_) /___  __          
#      /  /_/ / / |/_/ _ \/ / __ '/ ___/ / __/ / / /          
#     / ____ / />   <| __/ / /_/ / /  / / /_/ /_/ /           
#    /_/    /_//_/|_/___/_/\__,_/_/ /_/\__/\__,  /            
#                            by Kyliekyler /____/             

while [ `getprop vendor.post_boot.parsed` != "1" ]; do
    sleep 1
done

sleep 60
write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor performance
write /sys/devices/system/cpu/cpufreq/performance/go_hispeed_load 75
write /sys/devices/system/cpu/cpufreq/performance/above_hispeed_delay 0
write /sys/devices/system/cpu/cpufreq/performance/boost 1
write /sys/module/msm_performance/parameters/touchboost 1
write /sys/devices/system/cpu/cpufreq/performance/max_freq_hysteresis 1
write /sys/devices/system/cpu/cpufreq/performance/align_windows 1
write /sys/devices/soc/1c00000.qcom,kgsl-3d0/devfreq/1c00000.qcom,kgsl-3d0/governor performance
write /sys/class/kgsl/kgsl-3d0/devfreq/governor msm-adreno-tz
write /sys/module/adreno_idler/parameters/adreno_idler_active 0
write /sys/module/lazyplug/parameters/nr_possible_cores 8
write /dev/cpuset/foreground/cpus 0-2,4-7
write /dev/cpuset/foreground/boost/cpus 4-7
write /dev/cpuset/top-app/cpus 0-7
echo 1 > /sys/devices/system/cpu/cpu0/core_ctl/enable
echo 1 > /sys/devices/system/cpu/cpu0/core_ctl/min_cpus
echo 4 > /sys/devices/system/cpu/cpu0/core_ctl/max_cpus
echo 100 > /sys/devices/system/cpu/cpu0/core_ctl/offline_delay_ms
echo 0 > /sys/devices/system/cpu/cpu0/core_ctl/is_big_cluster
echo 1 > /sys/devices/system/cpu/cpu4/core_ctl/enable
echo 2 > /sys/devices/system/cpu/cpu4/core_ctl/min_cpus
echo 4 > /sys/devices/system/cpu/cpu4/core_ctl/max_cpus
echo 70 > /sys/devices/system/cpu/cpu4/core_ctl/busy_up_thres
echo 60 > /sys/devices/system/cpu/cpu4/core_ctl/busy_down_thres
echo 100 > /sys/devices/system/cpu/cpu4/core_ctl/offline_delay_ms
echo 1 > /sys/devices/system/cpu/cpu4/core_ctl/is_big_cluster
echo 4 > /sys/devices/system/cpu/cpu4/core_ctl/task_thres
echo 95 > /proc/sys/kernel/sched_upmigrate
echo 85 > /proc/sys/kernel/sched_downmigrate
echo 100 > /proc/sys/kernel/sched_group_upmigrate
echo 95 > /proc/sys/kernel/sched_group_downmigrate
echo 'schedutil' > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
echo 'schedutil' > /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor
echo 'schedutil' > /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor
echo 'schedutil' > /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor
echo 'schedutil' > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo 'schedutil' > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo 'schedutil' > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
echo 'schedutil' > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
chmod 644 /sys/module/workqueue/parameters/power_efficient
echo 'N' > /sys/module/workqueue/parameters/power_efficient
echo "0:0 4:0" > /sys/module/cpu_boost/parameters/topkek_boost_freq
echo '100' > /sys/module/cpu_boost/parameters/topkek_boost_ms
echo '0:0' > /sys/module/cpu_boost/parameters/input_boost_freq
echo '1:0' > /sys/module/cpu_boost/parameters/input_boost_freq
echo '2:0' > /sys/module/cpu_boost/parameters/input_boost_freq
echo '3:0' > /sys/module/cpu_boost/parameters/input_boost_freq
echo '4:0' > /sys/module/cpu_boost/parameters/input_boost_freq
echo '5:0' > /sys/module/cpu_boost/parameters/input_boost_freq
echo '6:0' > /sys/module/cpu_boost/parameters/input_boost_freq
echo '7:0' > /sys/module/cpu_boost/parameters/input_boost_freq
echo '100' > /sys/module/cpu_boost/parameters/input_boost_ms
echo '20000' > /sys/devices/system/cpu/cpufreq/policy0/schedutil/down_rate_limit_us
echo '1000' > /sys/devices/system/cpu/cpufreq/policy0/schedutil/up_rate_limit_us	
echo '1' > /sys/devices/system/cpu/cpufreq/policy0/schedutil/iowait_boost_enable
echo '1209600' > /sys/devices/system/cpu/cpufreq/policy0/schedutil/hispeed_freq
echo '90' > /sys/devices/system/cpu/cpufreq/policy0/schedutil/hispeed_load
echo '1' > /sys/devices/system/cpu/cpufreq/policy0/schedutil/pl
echo '20000' > /sys/devices/system/cpu/cpufreq/policy4/schedutil/down_rate_limit_us
echo '1000' > /sys/devices/system/cpu/cpufreq/policy4/schedutil/up_rate_limit_us
echo '1' > /sys/devices/system/cpu/cpufreq/policy4/schedutil/iowait_boost_enable
echo '1574400' > /sys/devices/system/cpu/cpufreq/policy4/schedutil/hispeed_freq
echo '90' > /sys/devices/system/cpu/cpufreq/policy4/schedutil/hispeed_load
echo '1' > /sys/devices/system/cpu/cpufreq/policy4/schedutil/pl
echo 1 > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk
echo "16384,24576,32768,65536,131072,163840" > /sys/module/lowmemorykiller/parameters/minfree
echo 'cfq' > /sys/block/sda/queue/scheduler
echo '1024' > /sys/block/sda/queue/read_ahead_kb
echo '0' > /sys/block/sda/queue/rotational
echo '0' > /sys/block/sda/queue/iostats
echo '0' > /sys/block/sda/queue/add_random
echo '1' > /sys/block/sda/queue/rq_affinity
echo '0' > /sys/block/sda/queue/nomerges
echo '1024' > /sys/block/sda/queue/nr_requests
echo 'cfq' > /sys/block/sdb/queue/scheduler
echo '1024' > /sys/block/sdb/queue/read_ahead_kb
echo '0' > /sys/block/sdb/queue/rotational
echo '0' > /sys/block/sdb/queue/iostats
echo '0' > /sys/block/sdb/queue/add_random
echo '1' > /sys/block/sdb/queue/rq_affinity
echo '0' > /sys/block/sdb/queue/nomerges
echo '1024' > /sys/block/sdb/queue/nr_requests
echo 'cfq' > /sys/block/sdc/queue/scheduler
echo '1024' > /sys/block/sdc/queue/read_ahead_kb
echo '0' > /sys/block/sdc/queue/rotational
echo '0' > /sys/block/sdc/queue/iostats
echo '0' > /sys/block/sdc/queue/add_random
echo '1' > /sys/block/sdc/queue/rq_affinity
echo '0' > /sys/block/sdc/queue/nomerges
echo '1024' > /sys/block/sdc/queue/nr_requests
echo 'cfq' > /sys/block/sdd/queue/scheduler
echo '1024' > /sys/block/sdd/queue/read_ahead_kb
echo '0' > /sys/block/sdd/queue/rotational
echo '0' > /sys/block/sdd/queue/iostats
echo '0' > /sys/block/sdd/queue/add_random
echo '1' > /sys/block/sdd/queue/rq_affinity
echo '0' > /sys/block/sdd/queue/nomerges
echo '1024' > /sys/block/sdd/queue/nr_requests
echo 'cfq' > /sys/block/sde/queue/scheduler
echo '1024' > /sys/block/sde/queue/read_ahead_kb
echo '0' > /sys/block/sde/queue/rotational
echo '0' > /sys/block/sde/queue/iostats
echo '0' > /sys/block/sde/queue/add_random
echo '1' > /sys/block/sde/queue/rq_affinity
echo '0' > /sys/block/sde/queue/nomerges
echo '1024' > /sys/block/sde/queue/nr_requests
echo 'cfq' > /sys/block/sdf/queue/scheduler
echo '1024' > /sys/block/sdf/queue/read_ahead_kb
echo '0' > /sys/block/sdf/queue/rotational
echo '0' > /sys/block/sdf/queue/iostats
echo '0' > /sys/block/sdf/queue/add_random
echo '1' > /sys/block/sdf/queue/rq_affinity
echo '0' > /sys/block/sdf/queue/nomerges
echo '1024' > /sys/block/sdf/queue/nr_requests
echo 'cfq' > /sys/block/mmcblk0/queue/scheduler
echo '1024' > /sys/block/mmcblk0/queue/read_ahead_kb
echo '0' > /sys/block/mmcblk0/queue/rotational
echo '0' > /sys/block/mmcblk0/queue/iostats
echo '0' > /sys/block/mmcblk0/queue/add_random
echo '1' > /sys/block/mmcblk0/queue/rq_affinity
echo '0' > /sys/block/mmcblk0/queue/nomerges
echo '1024' > /sys/block/mmcblk0/queue/nr_requests
echo '1024' > /sys/block/zram0/queue/read_ahead_kb
echo 'N' > /sys/module/sync/parameters/fsync_enabled
echo '128' > /proc/sys/kernel/random/read_wakeup_threshold
echo '1024' > /proc/sys/kernel/random/write_wakeup_threshold
sysctl -w net.ipv4.tcp_congestion_control=cubic
echo 0-3 > /dev/cpuset/restricted/cpus
echo 100 > /sys/module/cpu_boost/parameters/input_boost_ms
echo 0-7 > /dev/cpuset/top-app/cpus
echo 0-7 > /dev/cpuset/game/cpus
echo 0-7 > /dev/cpuset/gamelite/cpus
echo "2-3,6-7" > /dev/cpuset/foreground/cpus
echo 2-3 > /dev/cpuset/background/cpus
echo 0-1 > /dev/cpuset/system-background/cpus
echo 1 > /dev/stune/top-app/schedtune.colocate
echo 1 > /dev/stune/top-app/schedtune.sched_boost_enabled
echo 1 > /dev/stune/top-app/schedtune.sched_boost_no_override
echo 0 > /dev/stune/top-app/schedtune.prefer_idle
echo 0 > /dev/stune/top-app/schedtune.boost
echo 0 > /dev/stune/foreground/schedtune.colocate
echo 1 > /dev/stune/foreground/schedtune.sched_boost_enabled
echo 0 > /dev/stune/foreground/schedtune.sched_boost_no_override
echo 0 > /dev/stune/foreground/schedtune.prefer_idle
echo 0 > /dev/stune/foreground/schedtune.boost
echo 0 > /dev/stune/background/schedtune.colocate
echo 1 > /dev/stune/background/schedtune.sched_boost_enabled
echo 0 > /dev/stune/background/schedtune.sched_boost_no_override
echo 0 > /dev/stune/background/schedtune.prefer_idle
echo 0 > /dev/stune/background/schedtune.boost
echo 0 > /dev/stune/schedtune.colocate
echo 1 > /dev/stune/schedtune.sched_boost_enabled
echo 0 > /dev/stune/schedtune.sched_boost_no_override
echo 0 > /dev/stune/schedtune.prefer_idle
echo 0 > /dev/stune/schedtune.boost
echo 70 > /sys/module/vmpressure/parameters/allocstall_threshold
echo 100 > /sys/module/vmpressure/parameters/vmpressure_scale_max
echo 15 > /proc/sys/vm/swappiness
echo 20 > /proc/sys/vm/dirty_ratio
echo 5 > /proc/sys/vm/dirty_background_ratio
echo 200 > /proc/sys/vm/dirty_expire_centisecs
echo 500 > /proc/sys/vm/dirty_writeback_centisecs
echo 0 > /proc/sys/vm/oom_kill_allocating_task
echo 1 > /proc/sys/vm/overcommit_memory
echo 50 > /proc/sys/vm/overcommit_ratio
echo 0 > /proc/sys/vm/drop_caches
echo 100 > /proc/sys/vm/vfs_cache_pressure
echo "0" > /sys/class/kgsl/kgsl-3d0/throttling
chmod 664 /system/app/EasterEgg/EasterEgg.apk
