# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit git-r3

DESCRIPTION="Program that mesures the time it takes to load a shared library"
HOMEPAGE="https://github.com/serge-sans-paille/load-time"
EGIT_REPO_URI="https://github.com/serge-sans-paille/${PN}"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="sys-devel/gcc"

DOCS=( README.rst LICENSE )

src_prepare() {
	default
}

src_compile() {
	emake 
}

src_install() {
	exeinto "/usr/bin"
	doexe ${PN}
	dodoc ${DOCS}
}
