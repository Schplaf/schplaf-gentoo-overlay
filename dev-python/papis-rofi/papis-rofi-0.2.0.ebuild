# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1

DESCRIPTION="Papis GUI using Rofi"
HOMEPAGE="https://github.com/papis/papis-rofi https://pypi.org/project/papis-rofi/"
#Release and tags stopped at 0.2.0 on GitHub (0.6.0 on pypi)
SRC_URI="https://github.com/papis/papis-rofi/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.rst doc/ )

distutils_enable_tests pytest

src_install() {
	distutils-r1_src_install
}
