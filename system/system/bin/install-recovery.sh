#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:5565c570fd288368fb534c63fa69819b2c9f9c72; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:d1210edb2695e2ebf67a3b7bc58e2e4ea7e532a2 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:5565c570fd288368fb534c63fa69819b2c9f9c72 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
