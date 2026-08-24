# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1 pypi

DESCRIPTION="Create and modify Microsoft Word documents with Python"
HOMEPAGE="
	https://github.com/python-openxml/python-docx/
	https://pypi.org/project/python-docx/
"
SRC_URI="https://github.com/python-openxml/python-docx/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S=${WORKDIR}/${P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/lxml-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.9.0[${PYTHON_USEDEP}]
"
#TODO: test, docs
#tests: behave>=1.2.3, pyparsing>=2.0.1, pytest>=2.5, pytest-coverage, pytest-xdist, ruff
#docs: Sphinx==1.8.6, Jinja2==2.11.3, MarkupSafe==0.23 , alabaster<0.7.14
BDEPEND="
	test? (
		>=dev-python/behave-1.2.3[${PYTHON_USEDEP}]
		>=dev-python/pyparsing-2.0.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-2.5[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
		dev-util/ruff
	)
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

#TODO
#DOCS=( LICENSE MANIFEST.in README.rst docs/ )
