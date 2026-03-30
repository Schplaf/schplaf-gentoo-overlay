# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

if [[ ${PV} != 9999 ]]; then
	SRC_URI="https://github.com/paoloap/zaread/archive/refs/tags/v${PV}.tar.gz  -> ${P}.gh.tar.gz"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/paoloap/zaread.git"
fi

DESCRIPTION="A lightweight document reader"
HOMEPAGE="https://github.com/paoloap/zaread"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="typst office mobi" #markdown

#Mandatopry dependencies: zathura
#+ optional dependencies:
#  - LibreOffice (office documents, CSV and RTF)
#  - Typst (typst documents)
#  - Calibre (convert mobi files using ebook-convert)
#  - md2pdf (markdown)
DEPEND="
	app-text/zathura
	office? ( virtual/ooo )
	mobi? ( app-text/calibre )
	typst? ( app-text/typst )
"
#TODO:
#- markdown? ( app-text/md2pdf )
#- add alternatives to md2pdf (for instance pandoc)

RDEPEND="${DEPEND}"

DOCS=( README.md LICENSE )

src_compile() {
	true
}

src_install() {
	exeinto /usr/bin
	doexe ${PN}
	domenu ${PN}.desktop
	dodoc ${DOCS}
}

pkg_postinst() {
	xdg_desktop_database_update
}
