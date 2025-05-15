# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="Python package to work with Document Object Identifier (doi)"
HOMEPAGE="https://github.com/papis/python-doi https://pypi.org/project/python-doi"
#https://github.com/alejandrogallo/python-doi
SRC_URI="https://github.com/papis/python-doi/archive/refs/tags/v0.2.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( AUTHORS.rst CONTRIBUTING.rst CHANGELOG.md LICENSE README.rst)

distutils_enable_tests pytest

src_install() {
	distutils-r1_src_install
}
