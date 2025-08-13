# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )
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

RDEPEND="
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

DOCS=( LICENSE MANIFEST.in README.rst )

python_prepare_all() {
	mv tests markdownify/tests || die
	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
	distutils-r1_python_prepare_all
}

src_install() {
	distutils-r1_src_install
}
