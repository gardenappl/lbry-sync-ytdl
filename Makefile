PREFIX = /usr
BINDIR = ${PREFIX}/bin
MANDIR = ${PREFIX}/share/man


all:
	pod2man lbry-sync-ytdl --center="General Commands Manual" > lbry-sync-ytdl.1

install:
	install -d "${DESTDIR}${BINDIR}"
	install -m 755 lbry-sync-ytdl "${DESTDIR}${BINDIR}"
	install -d "${DESTDIR}${MANDIR}/man1"
	install -m 644 lbry-sync-ytdl.1 "${DESTDIR}${MANDIR}/man1"

uninstall:
	rm "${DESTDIR}${BINDIR}/lbry-sync-ytdl" "${DESTDIR}${MANDIR}/man1/lbry-sync-ytdl.1"
