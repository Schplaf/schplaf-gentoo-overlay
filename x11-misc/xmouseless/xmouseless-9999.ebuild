# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A replacement for the physical mouse in Linux"
HOMEPAGE="https://github.com/jbensmann/xmouseless"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jbensmann/xmouseless"
else
	#version 0.1.1 specified in Makefile
	#last commit in master: 6c20a2e3df9726d0f1f01856f57e03b182e8cade
	COMMIT=6c20a2e3df9726d0f1f01856f57e03b182e8cade
	SRC_URI="https://github.com/jbensmann/xmouseless/archive/${PN}-${COMMIT}.tar.gz -> ${PN}.tar.gz"
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	x11-libs/libXtst
	x11-libs/libX11
"
RDEPEND="${DEPEND}"

DOCS=( README.md LICENSE )

src_prepare() {
	eapply "${FILESDIR}"/${PN}-makefile.patch
	eapply_user
}

DIRBIN=/usr/bin
src_install() {
	exeinto ${DIRBIN}
	doexe xmouseless

	dodoc ${DOCS}
}
