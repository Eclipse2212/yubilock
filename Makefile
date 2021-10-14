DESTDIR = 

install:
	install yubihibernate.sh ${DESTDIR}/usr/bin/yubihibernate
	mkdir -p  ${DESTDIR}/etc/yubihibernate
	cp device.conf.example  ${DESTDIR}/etc/yubihibernate/device.conf
	cp yubihibernate.service  ${DESTDIR}/etc/systemd/system/yubihibernate.service

uninstall:
	rm -r  ${DESTDIR}/usr/bin/yubihibernate  ${DESTDIR}/etc/yubihibernate  ${DESTDIR}/etc/systemd/system/yubihibernate.service
