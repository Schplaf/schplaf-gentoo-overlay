# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7,8,9} )

inherit bash-completion-r1 python-r1

DESCRIPTION="A command line utility to search DuckDuckGo from the terminal"
HOMEPAGE="https://github.com/jarun/ddgr"

if [[ "${PV}" == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jarun/${PN}.git"
else
	#SRC_URI="https://github.com/jarun/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	SRC_URI="https://github.com/jarun/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

#DEPEND=""
#RDEPEND="${DEPEND}"
#BDEPEND=""

DOCS=( README.md CHANGELOG )

src_install() {
	exeinto "/usr/bin"
	doexe "${PN}"
	doman "${PN}.1"
	dodoc ${DOCS}
}
