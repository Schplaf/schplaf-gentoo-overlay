# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
CMAKE_MAKEFILE_GENERATOR=emake
inherit cmake

DESCRIPTION="Minimalistic 3D object viewer running the terminal"
HOMEPAGE="https://github.com/admtrv/objcurses"
#SRC_URI=""
if [[ "${PV}" == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/admtrv/${PN}"
else
	SRC_URI="https://github.com/admtrv/objcurses/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="sys-libs/ncurses:0="
DEPEND="${RDEPEND}"
BDEPEND=""

DOCS=( README.md LICENSE.md )

#src_prepare() {
#	cmake_src_prepare
#}
#
#src_install() {
#	cmake_src_install
#}

src_configure() {
	cmake_src_configure
}

src_install() {
	dodoc ${DOCS}
	cmake_src_install
}

src_install() {
	exeinto /usr/bin
	newexe ${BUILD_DIR}/"${PN}" "${PN}"
}
