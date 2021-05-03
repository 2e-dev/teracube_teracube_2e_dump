#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:4fa4684101b24fad814277d3076c94e69cda2cb1; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:56084167078bd4553f9f31778ffa96ed6cae9a3f \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:4fa4684101b24fad814277d3076c94e69cda2cb1 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
