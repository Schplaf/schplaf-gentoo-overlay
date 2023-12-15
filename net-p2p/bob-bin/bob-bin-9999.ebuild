# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

UPSTREAM_PN="bob.com"
MY_PN="bob"
S=${WORKDIR}/

DESCRIPTION="B·o·B, an universal & secure peer-to-peer file-transfer (binary version)"
HOMEPAGE="
	https://bob.osau.re/
	https://github.com/dinosaure/bob
"
SRC_URI="https://builds.osau.re/job/bob/build/latest/f/bin/${UPSTREAM_PN} -> ${MY_PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	exeinto /usr/bin
	newexe ${DISTDIR}/"${MY_PN}" "${MY_PN}"
}

pkg_postinst() {
	einfo "Turn bob.com into a truly native program (assimilation)"
	su -s /bin/sh -c "/usr/bin/bob --assimilate"
}

