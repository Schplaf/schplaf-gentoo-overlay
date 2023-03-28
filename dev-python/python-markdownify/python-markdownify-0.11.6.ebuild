# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="Library to convert HTML to Markdown"
HOMEPAGE="
	https://pypi.org/project/markdownify/
	https://github.com/matthewwithanm/python-markdownify
"
SRC_URI="https://github.com/matthewwithanm/python-markdownify/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

distutils_enable_tests pytest

DOCS=( README.rst MANIFEST.in LICENSE )

python_prepare_all() {
	# FIXME: issue  #86 has been open upstream ini order to fix setup.py
	# find_packages() -> find_packages(exclude=["tests"]))
	# for the moment, we remove tests/
	rm -Rf tests/ || die

	distutils-r1_python_prepare_all
}

src_install() {
	distutils-r1_src_install
}
