#!/system/bin/sh

#         ____ _            __           _ __                 
#       /  __ \_)   _____  / /___ ______(_) /___  __          
#      /  /_/ / / |/_/ _ \/ / __ '/ ___/ / __/ / / /          
#     / ____ / />   <| __/ / /_/ / /  / / /_/ /_/ /           
#    /_/    /_//_/|_/___/_/\__,_/_/ /_/\__/\__,  /            
#                            by Kyliekyler /____/     
        
case $HALT in
  true)
    exit 1
  ;;
  
  false)
    case $GMC in
      cont)
        stop perfd
        # VARS IS HERE ====================================================//
        GOV=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
        KYLIEKYLERA=16384; KYLIEKYLERB=24576; KYLIEKYLERC=32768; KYLIEKYLERD=65536; KYLIEKYLERE=131072; KYLIEKYLERF=163840
   
        case $GOV in
          blu_schedutil|sched|pwrutil|darkutil|schedutil|helix|schedalucard|electronutil)
            EAS=true
          ;;
      
          *)
            EAS=false
          ;;
        esac
        
        if [ -a "/sys/module/adreno_idler" ]; then
          IDLER=1
        else
          IDLER=0 
        fi
    
        if [ -d "/sys/class/kgsl/kgsl-3d0" ]; then
          GPU=$(/sys/class/kgsl/kgsl-3d0)
        else
          GPU=$(/sys/devices/soc/*.qcom,kgsl-3d0/kgsl/kgsl-3d0)
        fi
        
        # NFS ADJ IS HERE THANKS TO K1KS ==================================//
        NFSADJ1=0; NFSADJ2=117; NFSADJ3=235; NFSADJ4=411; NFSADJ5=823; NFSADJ6=1000
    
        # THERMAL SCONFIG IS HERE =========================================//
        echo 13 > /sys/class/thermal/thermal_message/sconfig
     
        # ENTROPY IS HERE =================================================//
        echo 1024 > /proc/sys/kernel/random/read_wakeup_threshold
        echo 4096 > /proc/sys/kernel/random/write_wakeup_threshold

        chmod 644 /sys/block/mmcblk0/queue/read_ahead_kb
        echo 1024 > /sys/block/mmcblk0/queue/read_ahead_kb
        chmod 644 /sys/block/mmcblk1/queue/read_ahead_kb
        echo 1024 > /sys/block/mmcblk1/queue/read_ahead_kb

        chmod 644 /sys/block/mmcblk0/queue/iostats
        chmod 644 /sys/block/mmcblk1/queue/iostats
        echo 0 > /sys/block/mmcblk0/queue/iostats
        echo 0 > /sys/block/mmcblk1/queue/iostats

        # VM IS HERE ======================================================//
        echo 200 > /proc/sys/vm/dirty_expire_centisecs
        echo 300 > /proc/sys/vm/dirty_writeback_centisecs
        chmod 644 /proc/sys/vm/swappiness
        echo 100 > /proc/sys/vm/swappiness
        echo 90 > /proc/sys/vm/dirty_ratio
        echo 75 > /proc/sys/vm/dirty_background_ratio
        echo 1 > /proc/sys/vm/page-cluster
        echo 4096 > /proc/sys/vm/min_free_kb
        echo 20 > /proc/sys/fs/lease-break-time
        echo 4096 > /proc/sys/vm/min_free_kbytes
        echo 400 > /proc/sys/vm/vfs_cache_pressure
        echo 80 > /proc/sys/vm/overcommit_ratio
        echo 24300 > /proc/sys/vm/extra_free_kbytes

        # WAKELOCK IS HERE ================================================//
        echo N > /sys/module/wakeup/parameters/enable_wlan_wow_wl_ws
        echo N > /sys/module/wakeup/parameters/enable_wlan_extscan_wl_ws
        echo N > /sys/module/wakeup/parameters/enable_timerfd_ws
        echo N > /sys/module/wakeup/parameters/enable_qcom_rx_wakelock_ws
        echo N > /sys/module/wakeup/parameters/enable_netlink_ws
        echo N > /sys/module/wakeup/parameters/enable_ipa_ws
        echo N > /sys/module/wakeup/parameters/enable_bluedroid_timer_ws
        echo N > /sys/module/wakeup/parameters/enable_wlan_wake_ws
        echo N > /sys/module/wakeup/parameters/enable_wlan_ctrl_wake_ws
        echo N > /sys/module/wakeup/parameters/enable_wlan_rx_wake_ws
        echo N > /sys/module/wakeup/parameters/enable_msm_hsic_ws
        echo N > /sys/module/wakeup/parameters/enable_si_ws
    
        # POWER IS HERE ===================================================//
        chmod 644 /sys/module/workqueue/parameters/power_efficient
        echo N > /sys/module/workqueue/parameters/power_efficient
 
        chmod 644 /sys/kernel/sched/arch_power
        echo 0 > /sys/kernel/sched/arch_power
    
        # FSYNC IS HERE ===================================================//
        echo N > /sys/module/sync/parameters/fsync_enabled
        echo 0 > /sys/module/sync/parameters/auto_fsync_delay_sec
    
        # FORCE FAST CHARGE IS HERE =======================================//
        echo 1 > /sys/kernel/fast_charge/force_fast_charge

        # INPUT BOOST IS HERE =============================================//
        chmod 644 /sys/kernel/cpu_input_boost/enabled
        echo 0 > /sys/kernel/cpu_input_boost/enabled
        
        chmod 644 /sys/module/cpu_boost/parameters/input_boost_enabled
        echo N  > /sys/module/cpu_boost/parameters/input_boost_enabled

        # PANIC IS HERE ===================================================//
        chmod 644 /proc/sys/vm/panic_on_oom
        chmod 644 /proc/sys/kernel/panic
        chmod 644 /proc/sys/kernel/panic_on_oops
        echo 0 > /proc/sys/vm/panic_on_oom
        echo 0 > /proc/sys/kernel/panic
        echo 0 > /proc/sys/kernel/panic_on_oops

        echo 0 >  /sys/devices/system/cpu/cpu0/sched_mostly_idle_freq
        echo 0 >  /sys/devices/system/cpu/cpu4/sched_mostly_idle_freq
 
        # HMP / EAS TWEAKS IS HERE ========================================//
        case $EAS in
          true)
            echo 128 > /proc/sys/kernel/sched_nr_migrate 2>/dev/null
            echo 1 > /proc/sys/kernel/sched_cstate_aware 2>/dev/null
            echo 10 > /proc/sys/kernel/sched_initial_task_util 2>/dev/null
            if [ -e /proc/sys/kernel/sched_autogroup_enabled ]; then
              echo 0 > /proc/sys/kernel/sched_autogroup_enabled
            fi
      
            if [ -e "/proc/sys/kernel/sched_is_big_little" ]; then
              echo 1 > /proc/sys/kernel/sched_is_big_little	
            fi
      
            if [ -e "/proc/sys/kernel/sched_boost" ]; then
              echo 0 > /proc/sys/kernel/sched_boost
            fi
      
            if [ -e "/proc/sys/kernel/sched_use_walt_task_util" ]; then
              echo 1 > /proc/sys/kernel/sched_use_walt_task_util
              echo 1 > /proc/sys/kernel/sched_use_walt_cpu_util 2>/dev/null
              echo 10 > /proc/sys/kernel/sched_walt_init_task_load_pct 2>/dev/null
            fi
          ;;
 
          false)
            echo 1 > /proc/sys/kernel/sched_enable_thread_grouping 2>/dev/null
            echo 30 > /proc/sys/kernel/sched_big_waker_task_load 2>/dev/null
            echo 3 > /proc/sys/kernel/sched_window_stats_policy 2>/dev/null
            echo 4 > /proc/sys/kernel/sched_ravg_hist_size 2>/dev/null
            echo 3 > /proc/sys/kernel/sched_spill_nr_run 2>/dev/null
            echo 55 > /proc/sys/kernel/sched_spill_load 2>/dev/null
            echo 1 > /proc/sys/kernel/sched_enable_thread_grouping 2>/dev/null
            echo 1 > /proc/sys/kernel/sched_restrict_cluster_spill 2>/dev/null
            echo 120 > /proc/sys/kernel/sched_upmigrate 2>/dev/null
            echo 100 > /proc/sys/kernel/sched_downmigrate 2>/dev/null
            echo 15 > /proc/sys/kernel/sched_small_wakee_task_load 2>/dev/null
            echo 0 > /proc/sys/kernel/sched_init_task_load 2>/dev/null
            echo 30 > /proc/sys/kernel/sched_rr_timeslice_ms
            if [ -e /proc/sys/kernel/sched_enable_power_aware ]; then
              echo 1 > /proc/sys/kernel/sched_enable_power_aware
            fi
      
            if [ -e "/proc/sys/kernel/sched_upmigrate_min_nice" ]; then
              echo 9 > /proc/sys/kernel/sched_upmigrate_min_nice
            fi
       
            if [ -e "/proc/sys/kernel/sched_wakeup_load_threshold" ]; then
              echo 110 > /proc/sys/kernel/sched_wakeup_load_threshold
            fi
        
            if [ -e "/proc/sys/kernel/sched_migration_fixup" ]; then
              echo 1 > /proc/sys/kernel/sched_migration_fixup
            fi
          
            if [ -e "/proc/sys/kernel/sched_boost" ]; then
              echo 0 > /proc/sys/kernel/sched_boost
            fi
      
            if [ -e "/proc/sys/kernel/sched_heavy_task" ]; then
              echo 55 > /proc/sys/kernel/sched_heavy_task
            fi
			
            if [ -e "/proc/sys/kernel/sched_enable_power_aware" ]; then
              echo 1 > /proc/sys/kernel/sched_enable_power_aware
            fi
			
            if [ -e "/proc/sys/kernel/sched_small_task" ]; then
              echo 10 > /proc/sys/kernel/sched_small_task
            fi
      
            if [ -e "/proc/sys/kernel/sched_migration_fixup" ]; then
              echo 1 > /proc/sys/kernel/sched_migration_fixup
            fi
      
            if [ -e "/proc/sys/kernel/sched_boost" ]; then
              echo 0 > /proc/sys/kernel/sched_boost
            fi  
          ;;
        esac
    
        # PARAMETERS / MINFREE IS HERE ====================================//    
        chmod 0666 /sys/module/lowmemorykiller/parameters/adj;
        chmod 0666 /sys/module/lowmemorykiller/parameters/minfree;
    
        echo 0 > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk;
        echo $NFSADJ1,$NFSADJ2,$NFSADJ3,$NFSADJ4,$NFSADJ5,$NFSADJ6 > /sys/module/lowmemorykiller/parameters/adj;
        echo $KYLIEKYLERA,$KYLIEKYLERB,$KYLIEKYLERC,$KYLIEKYLERD,$KYLIEKYLERE,$KYLIEKYLERF > /sys/module/lowmemorykiller/parameters/minfree;
    
        # ANIMATION SCALE IS HERE =========================================//
        settings put global window_animation_scale 1
        settings put global transition_animation_scale 1
        settings put global animator_duration_scale 1
        
        # CPU SET TUNING IS HERE ==========================================//
        echo 100 > /sys/module/cpu_boost/parameters/input_boost_ms
        echo 0-7 > /dev/cpuset/top-app/cpus
        echo 0-7 > /dev/cpuset/game/cpus
        echo 0-7 > /dev/cpuset/gamelite/cpus
        echo 2-3,6-7 > /dev/cpuset/foreground/cpus
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
    
        #GPU IS HERE ======================================================//    
        if [ -a "/sys/class/kgsl/kgsl-3d0" ]; then
          echo 0 > /sys/class/kgsl/kgsl-3d0/throttling
          echo 0 > /sys/class/kgsl/kgsl-3d0/force_no_nap
          echo 0 > /sys/class/kgsl/kgsl-3d0/force_bus_on
          echo 0 > /sys/class/kgsl/kgsl-3d0/force_clk_on 
          echo 0 > /sys/class/kgsl/kgsl-3d0/force_rail_on
          echo 1 > /sys/class/kgsl/kgsl-3d0/bus_split
        elif [ -a "/sys/devices/soc/*.qcom,kgsl-3d0/kgsl/kgsl-3d0" ]; then
          echo 0 > /sys/devices/soc/*.qcom,kgsl-3d0/kgsl/kgsl-3d0/throttling
          echo 0 > /sys/devices/soc/*.qcom,kgsl-3d0/kgsl/kgsl-3d0/force_no_nap
          echo 0 > /sys/devices/soc/*.qcom,kgsl-3d0/kgsl/kgsl-3d0/force_bus_on
          echo 0 > /sys/devices/soc/*.qcom,kgsl-3d0/kgsl/kgsl-3d0/force_clk_on 
          echo 0 > /sys/devices/soc/*.qcom,kgsl-3d0/kgsl/kgsl-3d0/force_rail_on
          echo 1 > /sys/devices/soc/*.qcom,kgsl-3d0/kgsl/kgsl-3d0/bus_split
        fi
        
        case $IDLER in
	      1)
	        echo Y > /sys/module/adreno_idler/parameters/adreno_idler_active
            echo 40 > /sys/module/adreno_idler/parameters/adreno_idler_downdifferential
            echo 25 > /sys/module/adreno_idler/parameters/adreno_idler_idlewait
            echo 10000 > /sys/module/adreno_idler/parameters/adreno_idler_idleworkload
	      ;;
	    esac
    
        # NFS GPU TWEAKS IS HERE THANKS TO K1KS ===========================//
        if [ -e "$GPU/max_pwrlevel" ]; then 
          echo 0 > $GPU/max_pwrlevel
        elif [ -e $GPU/min_pwrlevel ] && [ -e $GPU/num_pwrlevels ]; then
          MIN=$(cat $GPU/num_pwrlevels)
          echo $MIN > $GPU/min_pwrlevel
        fi
    
        if [ -e "$GPU/devfreq/adrenoboost" ]; then 
          echo 2 > $GPU/devfreq/adrenoboost
        fi
    
        if [ -e "/sys/module/simple_gpu_algorithm/parameters/simple_gpu_activate" ]; then 
          echo Y > /sys/module/simple_gpu_algorithm/parameters/simple_gpu_activate
          echo 1 > /sys/module/simple_gpu_algorithm/parameters/simple_gpu_activate
        fi
    
        if [ -a "/sys/devices/14ac0000.mali" ]; then
          chmod 0000 /sys/devices/14ac0000.mali/dvfs
          chmod 0000 /sys/devices/14ac0000.mali/dvfs_min_lock
          chmod 0000 /sys/devices/14ac0000.mali/dvfs_max_lock
        fi
	
	    # SDCARD BOOST IS HERE ============================================//
        echo cfq > /sys/block/sda/queue/scheduler
        echo 1024 > /sys/block/sda/queue/read_ahead_kb
        echo 0 > /sys/block/sda/queue/rotational
        echo 0 > /sys/block/sda/queue/iostats
        echo 0 > /sys/block/sda/queue/add_random
        echo 1 > /sys/block/sda/queue/rq_affinity
        echo 0 > /sys/block/sda/queue/nomerges
        echo 1024 > /sys/block/sda/queue/nr_requests

        echo cfq > /sys/block/sdb/queue/scheduler
        echo 1024 > /sys/block/sdb/queue/read_ahead_kb
        echo 0 > /sys/block/sdb/queue/rotational
        echo 0 > /sys/block/sdb/queue/iostats
        echo 0 > /sys/block/sdb/queue/add_random
        echo 1 > /sys/block/sdb/queue/rq_affinity
        echo 0 > /sys/block/sdb/queue/nomerges
        echo 1024 > /sys/block/sdb/queue/nr_requests

        echo cfq > /sys/block/sdc/queue/scheduler
        echo 1024 > /sys/block/sdc/queue/read_ahead_kb
        echo 0 > /sys/block/sdc/queue/rotational
        echo 0 > /sys/block/sdc/queue/iostats
        echo 0 > /sys/block/sdc/queue/add_random
        echo 1 > /sys/block/sdc/queue/rq_affinity
        echo 0 > /sys/block/sdc/queue/nomerges
        echo 1024 > /sys/block/sdc/queue/nr_requests

        echo cfq > /sys/block/sdd/queue/scheduler
        echo 1024 > /sys/block/sdd/queue/read_ahead_kb
        echo 0 > /sys/block/sdd/queue/rotational
        echo 0 > /sys/block/sdd/queue/iostats
        echo 0 > /sys/block/sdd/queue/add_random
        echo 1 > /sys/block/sdd/queue/rq_affinity
        echo 0 > /sys/block/sdd/queue/nomerges
        echo 1024 > /sys/block/sdd/queue/nr_requests

        echo cfq > /sys/block/sde/queue/scheduler
        echo 1024 > /sys/block/sde/queue/read_ahead_kb
        echo 0 > /sys/block/sde/queue/rotational
        echo 0 > /sys/block/sde/queue/iostats
        echo 0 > /sys/block/sde/queue/add_random
        echo 1 > /sys/block/sde/queue/rq_affinity
        echo 0 > /sys/block/sde/queue/nomerges
        echo 1024 > /sys/block/sde/queue/nr_requests

        echo cfq > /sys/block/sdf/queue/scheduler
        echo 1024 > /sys/block/sdf/queue/read_ahead_kb
        echo 0 > /sys/block/sdf/queue/rotational
        echo 0 > /sys/block/sdf/queue/iostats
        echo 0 > /sys/block/sdf/queue/add_random
        echo 1 > /sys/block/sdf/queue/rq_affinity
        echo 0 > /sys/block/sdf/queue/nomerges
        echo 1024 > /sys/block/sdf/queue/nr_requests

        echo cfq > /sys/block/mmcblk0/queue/scheduler    
        echo 1024 > /sys/block/mmcblk0/queue/read_ahead_kb
        echo 0 > /sys/block/mmcblk0/queue/rotational
        echo 0 > /sys/block/mmcblk0/queue/iostats
        echo 0 > /sys/block/mmcblk0/queue/add_random
        echo 1 > /sys/block/mmcblk0/queue/rq_affinity
        echo 0 > /sys/block/mmcblk0/queue/nomerges
        echo 1024 > /sys/block/mmcblk0/queue/nr_requests
	
	    # BOOST PULSE IS HERE =============================================//
        echo 85000 > /sys/devices/system/cpu/cpu0/cpufreq/$GOV/boostpulse_duration
        echo 85000 > /sys/devices/system/cpu/cpu1/cpufreq/$GOV/boostpulse_duration
        echo 85000 > /sys/devices/system/cpu/cpu2/cpufreq/$GOV/boostpulse_duration
        echo 85000 > /sys/devices/system/cpu/cpu4/cpufreq/$GOV/boostpulse_duration
        echo 85000 > /sys/devices/system/cpu/cpu6/cpufreq/$GOV/boostpulse_duration
     
        echo 85000 > /sys/devices/system/cpu/cpufreq/policy4/$GOV/boostpulse_duration 
        echo 85000 > /sys/devices/system/cpu/cpufreq/policy2/$GOV/boostpulse_duration 
        echo 85000 > /sys/devices/system/cpu/cpufreq/policy0/$GOV/boostpulse_duration

        # SAMPLING IS HERE ================================================//
        echo 60000 > /sys/devices/system/cpu/cpu0/cpufreq/$GOV/min_sample_time
        echo 60000 > /sys/devices/system/cpu/cpu1/cpufreq/$GOV/min_sample_time
        echo 60000 > /sys/devices/system/cpu/cpu2/cpufreq/$GOV/min_sample_time
        echo 60000 > /sys/devices/system/cpu/cpu4/cpufreq/$GOV/min_sample_time
        echo 60000 > /sys/devices/system/cpu/cpu6/cpufreq/$GOV/min_sample_time 

        echo 60000 > /sys/devices/system/cpu/cpufreq/policy0/$GOV/min_sample_time 
        echo 60000 > /sys/devices/system/cpu/cpufreq/policy4/$GOV/min_sample_time 
        echo 60000 > /sys/devices/system/cpu/cpufreq/policy2/$GOV/min_sample_time 

        # HIGH SPEED NOTIFICATION IS HERE =================================// 
        echo 1 > /sys/devices/system/cpu/cpufreq/policy4/$GOV/ignore_hispeed_on_notif 
        echo 1 > /sys/devices/system/cpu/cpufreq/policy0/$GOV/ignore_hispeed_on_notif 
        echo 1 > /sys/devices/system/cpu/cpufreq/policy2/$GOV/ignore_hispeed_on_notif 

        echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/$GOV/ignore_hispeed_on_notif 
        echo 1 > /sys/devices/system/cpu/cpu2/cpufreq/$GOV/ignore_hispeed_on_notif 
        echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/$GOV/ignore_hispeed_on_notif 
        echo 1 > /sys/devices/system/cpu/cpu6/cpufreq/$GOV/ignore_hispeed_on_notif 
        echo 1 > /sys/devices/system/cpu/cpu1/cpufreq/$GOV/ignore_hispeed_on_notif

        # BACKGROUND CPU IS HERE ==========================================//
        echo 0 > /dev/cpuset/background/cpus 
        echo 0 > /dev/cpuset/system-background/cpus

        # CPU IDLE IS HERE ================================================//
        echo 0 >  /sys/devices/system/cpu/cpu0/sched_mostly_idle_freq
        echo 0 >  /sys/devices/system/cpu/cpu4/sched_mostly_idle_freq
        echo 0 >  /sys/devices/system/cpu/cpu2/sched_mostly_idle_freq
        echo 0 >  /sys/devices/system/cpu/cpu4/sched_mostly_idle_freq
        echo 0 >  /sys/devices/system/cpu/cpu6/sched_mostly_idle_freq
        echo 0 >  /sys/devices/system/cpu/cpu1/sched_mostly_idle_freq

        # HIGH SPEED LOAD IS HERE =========================================//
        echo 100 > /sys/devices/system/cpu/cpu4/cpufreq/$GOV/go_hispeed_load
        echo 100 > /sys/devices/system/cpu/cpu0/cpufreq/$GOV/go_hispeed_load
        echo 100 > /sys/devices/system/cpu/cpu2/cpufreq/$GOV/go_hispeed_load
        echo 100 > /sys/devices/system/cpu/cpu1/cpufreq/$GOV/go_hispeed_load
        echo 100 > /sys/devices/system/cpu/cpu6/cpufreq/$GOV/go_hispeed_load
        echo 100 > /sys/devices/system/cpu/cpu8/cpufreq/$GOV/go_hispeed_load

        echo 100 > /sys/devices/system/cpu/cpufreq/policy0/$GOV/go_hispeed_load
        echo 100 > /sys/devices/system/cpu/cpufreq/policy2/$GOV/go_hispeed_load
        echo 100 > /sys/devices/system/cpu/cpufreq/policy4/$GOV/go_hispeed_load
        echo 100 > /sys/devices/system/cpu/cpufreq/policy6/$GOV/go_hispeed_load 

        # ALIGN RAMP DOWN IS HERE =========================================//
        echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/$GOV/fast_ramp_down
        echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/$GOV/align_windows
        echo 0 > /sys/devices/system/cpu/cpu1/cpufreq/$GOV/fast_ramp_down
        echo 1 > /sys/devices/system/cpu/cpu1/cpufreq/$GOV/align_windows
        echo 0 > /sys/devices/system/cpu/cpu2/cpufreq/$GOV/fast_ramp_down
        echo 1 > /sys/devices/system/cpu/cpu2/cpufreq/$GOV/align_windows
        echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/$GOV/fast_ramp_down
        echo 1 > /sys/devices/system/cpu/cpu4/cpufreq/$GOV/align_windows
        echo 0 > /sys/devices/system/cpu/cpu6/cpufreq/$GOV/fast_ramp_down
        echo 1 > /sys/devices/system/cpu/cpu6/cpufreq/$GOV/align_windows
        echo 0 > /sys/devices/system/cpu/cpu8/cpufreq/$GOV/fast_ramp_down
        echo 1 > /sys/devices/system/cpu/cpu8/cpufreq/$GOV/align_windows

        echo 1 > /sys/devices/system/cpu/cpufreq/policy0/$GOV/align_windows
        echo 1 > /sys/devices/system/cpu/cpufreq/policy4/$GOV/align_windows
        echo 1 > /sys/devices/system/cpu/cpufreq/policy2/$GOV/align_windows
        echo 1 > /sys/devices/system/cpu/cpufreq/policy6/$GOV/align_windows
        echo 1 > /sys/devices/system/cpu/cpufreq/policy8/$GOV/align_windows
        echo 1 > /sys/devices/system/cpu/cpufreq/policy1/$GOV/align_windows

        echo 0 > /sys/devices/system/cpu/cpufreq/policy0/$GOV/fast_ramp_down
        echo 0 > /sys/devices/system/cpu/cpufreq/policy1/$GOV/fast_ramp_down
        echo 0 > /sys/devices/system/cpu/cpufreq/policy2/$GOV/fast_ramp_down
        echo 0 > /sys/devices/system/cpu/cpufreq/policy4/$GOV/fast_ramp_down
        echo 0 > /sys/devices/system/cpu/cpufreq/policy6/$GOV/fast_ramp_down
        echo 0 > /sys/devices/system/cpu/cpufreq/policy8/$GOV/fast_ramp_down

        # DELAY IS HERE ===================================================//
        echo 12000 > /sys/devices/system/cpu/cpu0/cpufreq/$GOV/above_hispeed_delay
        echo 12000 > /sys/devices/system/cpu/cpu1/cpufreq/$GOV/above_hispeed_delay
        echo 12000 > /sys/devices/system/cpu/cpu2/cpufreq/$GOV/above_hispeed_delay
        echo 12000 > /sys/devices/system/cpu/cpu4/cpufreq/$GOV/above_hispeed_delay
        echo 12000 > /sys/devices/system/cpu/cpu6/cpufreq/$GOV/above_hispeed_delay
        echo 12000 > /sys/devices/system/cpu/cpu8/cpufreq/$GOV/above_hispeed_delay

        echo 12000 > /sys/devices/system/cpu/cpufreq/policy0/$GOV/above_hispeed_delay
        echo 12000 > /sys/devices/system/cpu/cpufreq/policy1/$GOV/above_hispeed_delay
        echo 12000 > /sys/devices/system/cpu/cpufreq/policy2/$GOV/above_hispeed_delay
        echo 12000 > /sys/devices/system/cpu/cpufreq/policy4/$GOV/above_hispeed_delay
        echo 12000 > /sys/devices/system/cpu/cpufreq/policy6/$GOV/above_hispeed_delay
        echo 12000 > /sys/devices/system/cpu/cpufreq/policy8/$GOV/above_hispeed_delay

        # HYSTERESIS IS HERE ==============================================//
        echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/$GOV/max_freq_hysteresis
        echo 0 > /sys/devices/system/cpu/cpu1/cpufreq/$GOV/max_freq_hysteresis
        echo 0 > /sys/devices/system/cpu/cpu2/cpufreq/$GOV/max_freq_hysteresis
        echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/$GOV/max_freq_hysteresis
        echo 0 > /sys/devices/system/cpu/cpu6/cpufreq/$GOV/max_freq_hysteresis
        echo 0 > /sys/devices/system/cpu/cpu8/cpufreq/$GOV/max_freq_hysteresis

        echo 0 > /sys/devices/system/cpu/cpufreq/policy0/$GOV/max_freq_hysteresis
        echo 0 > /sys/devices/system/cpu/cpufreq/policy1/$GOV/max_freq_hysteresis
        echo 0 > /sys/devices/system/cpu/cpufreq/policy2/$GOV/max_freq_hysteresis
        echo 0 > /sys/devices/system/cpu/cpufreq/policy4/$GOV/max_freq_hysteresis
        echo 0 > /sys/devices/system/cpu/cpufreq/policy6/$GOV/max_freq_hysteresis
        echo 0 > /sys/devices/system/cpu/cpufreq/policy8/$GOV/max_freq_hysteresis

        echo 50000 > /sys/devices/system/cpu/cpu0/cpufreq/$GOV/timer_slack
        echo 50000 > /sys/devices/system/cpu/cpu1/cpufreq/$GOV/timer_slack
        echo 50000 > /sys/devices/system/cpu/cpu2/cpufreq/$GOV/timer_slack
        echo 50000 > /sys/devices/system/cpu/cpu4/cpufreq/$GOV/timer_slack
        echo 50000 > /sys/devices/system/cpu/cpu6/cpufreq/$GOV/timer_slack
        echo 50000 > /sys/devices/system/cpu/cpu8/cpufreq/$GOV/timer_slack

        echo 50000 > /sys/devices/system/cpu/cpufreq/policy0/$GOV/timer_slack
        echo 50000 > /sys/devices/system/cpu/cpufreq/policy2/$GOV/timer_slack
        echo 50000 > /sys/devices/system/cpu/cpufreq/policy4/$GOV/timer_slack
        echo 50000 > /sys/devices/system/cpu/cpufreq/policy6/$GOV/timer_slack
        echo 50000 > /sys/devices/system/cpu/cpufreq/policy8/$GOV/timer_slack
        echo 50000 > /sys/devices/system/cpu/cpufreq/policy1/$GOV/timer_slack

        echo 0 > /sys/devices/system/cpu/cpufreq/policy0/$GOV/powersave_bias
        echo 0 > /sys/devices/system/cpu/cpufreq/policy2/$GOV/powersave_bias
        echo 0 > /sys/devices/system/cpu/cpufreq/policy4/$GOV/powersave_bias
        echo 0 > /sys/devices/system/cpu/cpufreq/policy6/$GOV/powersave_bias
        echo 0 > /sys/devices/system/cpu/cpufreq/policy8/$GOV/powersave_bias
        echo 0 > /sys/devices/system/cpu/cpufreq/policy1/$GOV/powersave_bias

        echo 0 > /sys/devices/system/cpu/cpu4/cpufreq/$GOV/powersave_bias
        echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/$GOV/powersave_bias
        echo 0 > /sys/devices/system/cpu/cpu2/cpufreq/$GOV/powersave_bias
        echo 0 > /sys/devices/system/cpu/cpu6/cpufreq/$GOV/powersave_bias
        echo 0 > /sys/devices/system/cpu/cpu8/cpufreq/$GOV/powersave_bias
        echo 0 > /sys/devices/system/cpu/cpu1/cpufreq/$GOV/powersave_bias

        echo 20000 > /sys/devices/system/cpu/cpu0/cpufreq/$GOV/timer_rate
        echo 20000 > /sys/devices/system/cpu/cpu1/cpufreq/$GOV/timer_rate
        echo 20000 > /sys/devices/system/cpu/cpu2/cpufreq/$GOV/timer_rate
        echo 20000 > /sys/devices/system/cpu/cpu4/cpufreq/$GOV/timer_rate
        echo 20000 > /sys/devices/system/cpu/cpu6/cpufreq/$GOV/timer_rate
        echo 20000 > /sys/devices/system/cpu/cpu8/cpufreq/$GOV/timer_rate

        echo 20000 > /sys/devices/system/cpu/cpufreq/policy0/$GOV/timer_rate
        echo 20000 > /sys/devices/system/cpu/cpufreq/policy2/$GOV/timer_rate
        echo 20000 > /sys/devices/system/cpu/cpufreq/policy4/$GOV/timer_rate
        echo 20000 > /sys/devices/system/cpu/cpufreq/policy6/$GOV/timer_rate
        echo 20000 > /sys/devices/system/cpu/cpufreq/policy8/$GOV/timer_rate
        echo 20000 > /sys/devices/system/cpu/cpufreq/policy1/$GOV/timer_rate
    
        # PROPS IS HERE ===================================================//   
        setprop ro.audio.flinger_standbytime_ms=100
        setprop persist.sys.composition.type gpu
        setprop persist.service.pcsync.enable 0
        setprop persist.service.lgospd.enable 0
        setprop persist.sys.purgeable_assets 1
        setprop persist.sys.ui.hw true
        setprop persist.sys.scrollingcache 3
        setprop persist.sys.use_16bpp_alpha 1
        setprop persist.sys.NV_FPSLIMIT 90
        setprop persist.sys.NV_POWERMODE 1
        setprop persist.sys.NV_PROFVER 15
        setprop persist.sys.NV_STEREOCTRL 0
        setprop persist.sys.NV_STEREOSEPCHG 0
        setprop persist.sys.NV_STEREOSEP 20
        setprop persist.sampling_profiler 0
        setprop persist.android.strictmode 0
        setprop persist.sys.use_dithering 0
        setprop persist.wpa_supplicant.debug false
        setprop ENFORCE_PROCESS_LIMIT false
        setprop MAX_SERVICE_INACTIVITY false
        setprop MIN_HIDDEN_APPS false
        setprop MAX_HIDDEN_APPS false
        setprop CONTENT_APP_IDLE_OFFSET false
        setprop EMPTY_APP_IDLE_OFFSET false
        setprop MAX_ACTIVITIES false
        setprop ACTIVITY_INACTIVITY_RESET_TIME false
        setprop MAX_RECENT_TASKS false
        setprop MIN_RECENT_TASKS false
        setprop APP_SWITCH_DELAY_TIME false
        setprop MAX_PROCESSES false
        setprop PROC_START_TIMEOUT false
        setprop CPU_MIN_CHECK_DURATION false
        setprop GC_TIMEOUT false
        setprop SERVICE_TIMEOUT false
        setprop MIN_CRASH_INTERVAL false
        setprop dalvik.vm.heapminfree 2m
        setprop com.qc.hardware true
        setprop debug.egl.hw 1
        setprop debug.egl.profiler 1
        setprop debug.enabletr true
        setprop debug.gralloc.enable_fb_ubwc 1
        setprop debug.overlayui.enable 1
        setprop debug.performance.tuning 1
        setprop debug.qc.hardware true
        setprop debug.qctwa.preservebuf 1
        setprop debug.qctwa.statusbar 1
        setprop debug.sf.hw 1
        setprop debug.sf.latch_unsignaled 1
        setprop dev.pm.dyn_samplingrate 1
        setprop hw3d.force 1
        setprop hwui.disable_vsync true
        setprop hwui.render_dirty_regions false
        setprop ro.config.enable.hw_accel true
        setprop ro.fb.mode 1
        setprop ro.product.gpu.driver 1
        setprop ro.sf.compbypass.enable 0 
    
        resetprop ro.audio.flinger_standbytime_ms=100
        resetprop persist.sys.composition.type gpu
        resetprop persist.service.pcsync.enable 0
        resetprop persist.service.lgospd.enable 0
        resetprop persist.sys.purgeable_assets 1
        resetprop persist.sys.ui.hw true
        resetprop persist.sys.scrollingcache 3
        resetprop persist.sys.use_16bpp_alpha 1
        resetprop persist.sys.NV_FPSLIMIT 90
        resetprop persist.sys.NV_POWERMODE 1
        resetprop persist.sys.NV_PROFVER 15
        resetprop persist.sys.NV_STEREOCTRL 0
        resetprop persist.sys.NV_STEREOSEPCHG 0
        resetprop persist.sys.NV_STEREOSEP 20
        resetprop persist.sampling_profiler 0
        resetprop persist.android.strictmode 0
        resetprop persist.sys.use_dithering 0
        resetprop persist.wpa_supplicant.debug false 
        resetprop ENFORCE_PROCESS_LIMIT false
        resetprop MAX_SERVICE_INACTIVITY false
        resetprop MIN_HIDDEN_APPS false
        resetprop MAX_HIDDEN_APPS false
        resetprop CONTENT_APP_IDLE_OFFSET false
        resetprop EMPTY_APP_IDLE_OFFSET false
        resetprop MAX_ACTIVITIES false
        resetprop ACTIVITY_INACTIVITY_RESET_TIME false
        resetprop MAX_RECENT_TASKS false
        resetprop MIN_RECENT_TASKS false
        resetprop APP_SWITCH_DELAY_TIME false
        resetprop MAX_PROCESSES false
        resetprop PROC_START_TIMEOUT false
        resetprop CPU_MIN_CHECK_DURATION false
        resetprop GC_TIMEOUT false
        resetprop SERVICE_TIMEOUT false
        resetprop MIN_CRASH_INTERVAL false
        resetprop dalvik.vm.heapminfree 2m
        resetprop com.qc.hardware true
        resetprop debug.egl.hw 1
        resetprop debug.egl.profiler 1
        resetprop debug.enabletr true
        resetprop debug.gralloc.enable_fb_ubwc 1
        resetprop debug.overlayui.enable 1
        resetprop debug.performance.tuning 1
        resetprop debug.qc.hardware true
        resetprop debug.qctwa.preservebuf 1
        resetprop debug.qctwa.statusbar 1
        resetprop debug.sf.hw 1
        resetprop debug.sf.latch_unsignaled 1
        resetprop dev.pm.dyn_samplingrate 1
        resetprop hw3d.force 1
        resetprop hwui.disable_vsync true
        resetprop hwui.render_dirty_regions false
        resetprop ro.config.enable.hw_accel true
        resetprop ro.fb.mode 1
        resetprop ro.product.gpu.driver 1
        resetprop ro.sf.compbypass.enable 0
        
        rm /data/system/perfd/default_values
        start perfd
      ;;
  
      abrt)
      ;;   
    esac 

    # GMS FIX IS HERE =====================================================//
    GMS=$(com.google.android.gms)
    GSF=$(com.google.android.gsf)
    su -c pm enable $GMS/.update.SystemUpdateActivity 
    su -c pm enable $GMS/.update.SystemUpdateService
    su -c pm enable $GMS/.update.SystemUpdateService$ActiveReceiver 
    su -c pm enable $GMS/.update.SystemUpdateService$Receiver 
    su -c pm enable $GMS/.update.SystemUpdateService$SecretCodeReceiver 
    su -c pm enable $GSF/.update.SystemUpdateActivity 
    su -c pm enable $GSF/.update.SystemUpdatePanoActivity 
    su -c pm enable $GSF/.update.SystemUpdateService 
    su -c pm enable $GSF/.update.SystemUpdateService$Receiver 
    su -c pm enable $GSF/.update.SystemUpdateService$SecretCodeReceiver
    
    # BACKGROUND IGNORE IS HERE ===========================================//
    cmd appops set hm.agni RUN_IN_BACKGROUND ignore
    cmd appops set hm.agni.control.dialog.helper RUN_IN_BACKGROUND ignore
    cmd appops set com.android.egg RUN_IN_BACKGROUND ignore
    cmd appops set com.android.dreams.basic RUN_IN_BACKGROUND ignore
    cmd appops set com.android.bluetooth RUN_IN_BACKGROUND ignore
    cmd appops set com.android.bookmarkprovider RUN_IN_BACKGROUND ignore
    cmd appops set com.android.calculator2 RUN_IN_BACKGROUND ignore
    cmd appops set com.android.calendar RUN_IN_BACKGROUND ignore
    cmd appops set com.android.providers.calendar RUN_IN_BACKGROUND ignore
    cmd appops set  RUN_IN_BACKGROUND ignore
    cmd appops set com.android.camera2 RUN_IN_BACKGROUND ignore
    cmd appops set  RUN_IN_BACKGROUND ignore
    cmd appops set com.android.wallpaperbackup RUN_IN_BACKGROUND ignore
    cmd appops set com.android.wallpapercropper RUN_IN_BACKGROUND ignore
    cmd appops set com.google.android.gms.setup RUN_IN_BACKGROUND ignore
    cmd appops set com.android.contacts RUN_IN_BACKGROUND ignore
    cmd appops set com.android.bips RUN_IN_BACKGROUND ignore
    cmd appops set com.android.email RUN_IN_BACKGROUND ignore
    cmd appops set com.android.emergency  RUN_IN_BACKGROUND ignore
    cmd appops set com.android.documentsui RUN_IN_BACKGROUND ignore
    cmd appops set com.caf.fmradio RUN_IN_BACKGROUND ignore
    cmd appops set com.android.gallery3d RUN_IN_BACKGROUND ignore
    cmd appops set com.google.android.GCMods5 RUN_IN_BACKGROUND ignore
    cmd appops set com.google.android.backuptransport RUN_IN_BACKGROUND ignore
    cmd appops set com.google.android.syncadapters.calendar RUN_IN_BACKGROUND ignore
    cmd appops set com.google.android.onetimeinitializer RUN_IN_BACKGROUND ignore
    cmd appops set com.google.android.partnersetup RUN_IN_BACKGROUND ignore
    cmd appops set com.google.android.gms RUN_IN_BACKGROUND ignore
    cmd appops set com.google.android.gsf RUN_IN_BACKGROUND ignore
    cmd appops set com.android.htmlviewer RUN_IN_BACKGROUND ignore
    cmd appops set com.android.wallpaper.livepicker RUN_IN_BACKGROUND ignore
    cmd appops set com.google.android.feedback RUN_IN_BACKGROUND ignore
    cmd appops set com.android.messaging RUN_IN_BACKGROUND ignore
    cmd appops set com.android.cellbroadcastreceiver RUN_IN_BACKGROUND ignore
    cmd appops set com.android.dreams.phototable RUN_IN_BACKGROUND ignore
    cmd appops set com.svox.pico RUN_IN_BACKGROUND ignore
    cmd appops set com.android.settings RUN_IN_BACKGROUND ignore
    cmd appops set com.google.android.setupwizard RUN_IN_BACKGROUND ignore
    cmd appops set com.android.packageinstaller RUN_IN_BACKGROUND ignore
    com.android.printspooler RUN_IN_BACKGROUND ignore
    com.android.printservice.recommendation RUN_IN_BACKGROUND ignore
  ;;
esac
