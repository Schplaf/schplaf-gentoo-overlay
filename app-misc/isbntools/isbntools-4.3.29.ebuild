# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

DESCRIPTION="app/framework for 'all things ISBN' including metadata, descriptions, covers..."
HOMEPAGE="
	https://github.com/xlcnd/isbntools/
	https://pypi.org/project/isbntools/
"

SRC_URI="https://github.com/xlcnd/isbntools/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/isbnlib-3.10.9[${PYTHON_USEDEP}]
	<dev-python/isbnlib-3.11.0[${PYTHON_USEDEP}]
"

BDEPEND=""

DOCS=( AUTHORS.md CHANGES.txt CODE_OF_CONDUCT.md CONTRIBUTING.md COPYRIGHT.txt LICENSE-LGPL-3.0.txt README.rst SECURITY.md release.md )

distutils_enable_tests pytest
