# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..12} )

inherit distutils-r1 pypi

DESCRIPTION="Fast kd-tree implementation with OpenMP-enabled queries"
HOMEPAGE="
	https://github.com/storpipfugl/pykdtree
	https://pypi.org/project/pykdtree/
"
	SRC_URI="https://github.com/storpipfugl/pykdtree/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/numpy"
BDEPEND="dev-python/cython"

DOCS=( README.rst README LICENSE.txt MANIFEST.in RELEASING.md CHANGELOG.md )

distutils_enable_tests setup.py

src_install() {
	distutils-r1_src_install
}
