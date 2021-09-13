# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Simple XLib program to highlight the cursor position"
HOMEPAGE="https://github.com/arp242/find-cursor"
SRC_URI="https://github.com/arp242/${PN}/archive/refs/tags/v${PV}.tar.gz  -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXrender
	x11-libs/libX11"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	eapply "${FILESDIR}"/${P}-makefile-destdir.patch
	eapply_user
}

src_install() {
	emake DESTDIR="${D}" install
}
