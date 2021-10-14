# YubiLock

### This project is forked from gitlab! (repo link below)
[Repo link](https://gitlab.com/TheOneWithTheBraid/yubihibernate)

Lock your computer as soon as your Yubikey is unplugged.

You *must* specify the device used and *can* tweak the mode (hibernate, sleep shutdown ec.) in `/etc/yubilock/device.conf`.

```bash
# install
# must be root
make install
ykinfo -s # check your device's serial number
# add the Iserial numberD to /etc/yubicohibernate/device.conf

systemctl daemon-reload
systemctl enable --now yubihibernate.service

# uninstall
systemctl disable --now yubihibernate.service
# must be root
make uninstall
systemctl daemon-reload

# locally test
cp device.conf.example device.conf
# now tweak device.conf
./yubihibernate.sh device.conf
```
