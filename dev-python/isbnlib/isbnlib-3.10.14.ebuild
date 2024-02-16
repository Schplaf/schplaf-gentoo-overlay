# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

DESCRIPTION="A library to validate, clean, transform and get metadata for ISBN strings"
HOMEPAGE="https://github.com/xlcnd/isbnlib/ https://pypi.org/project/isbnlib/"

SRC_URI="https://github.com/xlcnd/isbnlib/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND=""

DOCS=( AUTHORS.md CONTRIBUTING.md CHANGES.txt LICENSE-LGPL-3.0.txt release.md SECURITY.md README.rst COPYRIGHT.txt)

distutils_enable_tests setup.py

src_install() {
	distutils-r1_src_install
}
