### Dependencies

### System files
Files outside `$HOME` live in `system/` (ignored by chezmoi) and are installed by hand:

```
sudo install -m 644 system/etc/udev/rules.d/99-egpu-no-runtime-pm.rules /etc/udev/rules.d/
sudo udevadm control --reload
sudo install -m 644 system/etc/modprobe.d/xe.conf /etc/modprobe.d/
sudo mkinitcpio -P   # xe is in the initramfs (kms hook)
```
