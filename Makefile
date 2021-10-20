DESTDIR = 

install:
	install yubilock.sh ${DESTDIR}/usr/bin/yubilock
	mkdir -p  ${DESTDIR}/etc/yubilock
	cp device.conf.example  ${DESTDIR}/etc/yubilock/device.conf
	cp yubilock.service  ${DESTDIR}/etc/systemd/system/yubilock.service

uninstall:
	rm -r  ${DESTDIR}/usr/bin/yubilock  ${DESTDIR}/etc/yubilock  ${DESTDIR}/etc/systemd/system/yubilock.service
