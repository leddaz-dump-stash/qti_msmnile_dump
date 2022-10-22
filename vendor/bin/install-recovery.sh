#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/by-name/recovery:83886080:bd44e533ddfa102afb5505e4acc3e076e07c0897; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/by-name/boot:100663296:d354a0ec424373dcfd6aac88f28cc85dd311cb07 \
          --target EMMC:/dev/block/by-name/recovery:83886080:bd44e533ddfa102afb5505e4acc3e076e07c0897 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
