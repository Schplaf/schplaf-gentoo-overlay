# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A replacement for the physical mouse in Linux"
HOMEPAGE="https://github.com/jbensmann/xmouseless"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jbensmann/xmouseless"
else
	SRC_URI="https://github.com/jbensmann/xmouseless/archive/refs/tags/v${PV}.tar.gz -> ${PN}.tar.gz"
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
