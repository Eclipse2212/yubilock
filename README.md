# YubiLock

### This project is forked from gitlab! (repo link below)
[Repo link](https://gitlab.com/TheOneWithTheBraid/yubihibernate)

Lock your computer as soon as your Yubikey is unplugged.

You *must* specify the device used in `/etc/yubilock/device.conf`.

```bash
# Install
# As root
make install
# add the required data to /etc/yubilock/device.conf

systemctl daemon-reload
systemctl enable --now yubihibernate.service

# Uninstall
systemctl disable --now yubihibernate.service
# As root
make uninstall
systemctl daemon-reload

# Test a configuration
cp device.conf.example device.conf
./yubihibernate.sh device.conf
```
