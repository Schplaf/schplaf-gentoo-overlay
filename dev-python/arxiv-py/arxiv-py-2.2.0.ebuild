# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

#the name of the project is arxiv.py instead of arxiv-py
MY_PN=arxiv.py
MY_P=${MY_PN}-${PV}
S=${WORKDIR}/${MY_P}

DESCRIPTION="Python wrapper for the arXiv API"
HOMEPAGE=" https://github.com/lukasschwab/arxiv.py
	https://pypi.org/project/arxiv/
"
SRC_URI="https://github.com/lukasschwab/arxiv.py/archive/refs/tags/${PV}.tar.gz -> ${MY_P}.tar.gz"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/feedparser-6.0.10[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.0[${PYTHON_USEDEP}]
	test? (
		>=dev-python/pytest-6.2.2[${PYTHON_USEDEP}]
		dev-python/pdoc3
		dev-util/ruff
	)
"
BDEPEND=""

DOCS=( LICENSE.txt README.md )

distutils_enable_tests pytest


