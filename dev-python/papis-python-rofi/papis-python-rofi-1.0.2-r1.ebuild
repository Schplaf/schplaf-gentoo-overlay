# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

MY_PN=python-rofi
MY_P=${MY_PN}-${PV}
S=${WORKDIR}/${MY_P}

DESCRIPTION="Python module to create simple GUIs with Rofi (fork for papis)"
HOMEPAGE="https://github.com/papis/python-rofi/ https://pypi.org/project/papis-python-rofi/"
SRC_URI="https://github.com/papis/python-rofi/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.rst MANIFEST.in LICENSE )

distutils_enable_tests pytest

src_install() {
	distutils-r1_src_install
}
