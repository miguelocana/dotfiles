# Kanata Configuration

## Troubleshooting

### Permission denied for /dev/uinput

If kanata fails with:
```
Failed to open the output uinput device
Permission denied (os error 13)
```

1. Ensure `uinput` module is loaded:
   ```bash
   sudo modprobe uinput
   ```

2. Make module load on boot:
   ```bash
   echo "uinput" | sudo tee /etc/modules-load.d/uinput.conf
   ```

3. Ensure udev rule exists at `/etc/udev/rules.d/99-uinput.rules`:
   ```
   KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
   ```

4. Ensure user is in `uinput` group:
   ```bash
   sudo usermod -aG uinput $USER
   ```

5. If permissions still wrong (`crw-------` instead of `crw-rw----`), reload module:
   ```bash
   sudo rmmod uinput && sudo modprobe uinput
   ```

   Or manually fix:
   ```bash
   sudo chmod 660 /dev/uinput && sudo chown root:uinput /dev/uinput
   ```

6. Restart kanata:
   ```bash
   systemctl --user restart kanata
   ```
