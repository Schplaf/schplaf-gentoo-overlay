# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Program that measures the time it takes to load a shared library"
HOMEPAGE="https://github.com/serge-sans-paille/load-time"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/serge-sans-paille/${PN}"
else
	SRC_URI="https://github.com/serge-sans-paille/load-time/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~amd64"

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
