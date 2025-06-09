# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 pypi

MY_PN=CLImage
MY_P=${MY_PN}-${PV}
S=${WORKDIR}/${MY_P}

DESCRIPTION="Tool that converts images to beautiful ANSI escape codes for display in CLI"
HOMEPAGE="
	https://github.com/pnappa/CLImage
	https://pypi.org/project/climage/
"
SRC_URI="https://github.com/pnappa/CLImage/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/pykdtree[${PYTHON_USEDEP}]
"
BDEPEND=""

DOCS=( README.md LICENSE )

distutils_enable_tests pytest

src_prepare() {
	eapply "${FILESDIR}"/${PN}-climage.py-pykdtree_import.patch
	
	eapply_user
}

src_install() {
	distutils-r1_src_install
}
