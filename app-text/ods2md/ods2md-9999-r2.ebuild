# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit git-r3
PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_PEP517=no
inherit distutils-r1

DESCRIPTION="Convert LibreOffice Spreadsheets (*.ods) into Markdown tables"
HOMEPAGE="https://github.com/kennytm/ods2md"
EGIT_REPO_URI="https://github.com/kennytm/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

#dev-python/lxml ?
DEPEND=">=dev-python/pyexcel-ezodf-0.3.2"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.md )

src_install() {
	exeinto "/usr/bin"
	newexe ${PN}.py ${PN}
	dodoc ${DOCS}
}
