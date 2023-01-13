# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="A TTF font designed to make characters fill a square space."
HOMEPAGE="https://strlen.com/square/"
SRC_URI="https://strlen.com/files/square.ttf"

LICENSE="CC-BY-3.0" #Creative Commons Attribution 3.0 Unported licence
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

S="${WORKDIR}"
FONT_SUFFIX="ttf"

src_install() {
	mkdir -p ${D}/usr/share/fonts/square/
	cp ${DISTDIR}/${PN}.ttf ${D}/usr/share/fonts/square/${PN}.ttf
}
