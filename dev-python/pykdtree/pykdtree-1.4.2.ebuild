# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..13} )

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

#pyproject.toml: requires = ["setuptools", "numpy>=2.0.0rc1,<3", "Cython>=3"]
BDEPEND=">=dev-python/cython-3"[${PYTHON_USEDEP}]
DEPEND=">=dev-python/numpy-2.0.0"[${PYTHON_USEDEP}]
RDEPEND="${DEPEND}"

DOCS=( CHANGELOG.md LICENSE.txt MANIFEST.in README README.rst RELEASING.md )

distutils_enable_tests pytest

