# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=setuptools
DISTUTILS_USE_SETUPTOOLS=rdepend
inherit distutils-r1 pypi

DESCRIPTION="Command-line tool for looking up colors, shades and palettes"
HOMEPAGE="https://github.com/joowani/colorpedia"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

if [[ "${PV}" == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/joowani/colorpedia"
else
	#SRC_URI="https://github.com/joowani/colorpedia/archive/refs/tags/${PV}.tar.gz"
	SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"
fi

RDEPEND="
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/tomli[${PYTHON_USEDEP}]
	dev-python/pyparsing[${PYTHON_USEDEP}]
	dev-python/fire[${PYTHON_USEDEP}]
	dev-python/termcolor[${PYTHON_USEDEP}]
	"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	"

DOCS=( LICENSE docs/README.md docs/CONTRIBUTING.md )

#distutils_enable_tests pytest

src_install() {
	distutils-r1_src_install
}
