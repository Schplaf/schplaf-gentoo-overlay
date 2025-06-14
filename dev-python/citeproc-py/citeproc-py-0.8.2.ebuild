# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..13} )

inherit distutils-r1 pypi

#MY_PN=citeproc-py
#MY_P=${MY_PN}-${PV}
#S=${WORKDIR}/${MY_P}

DESCRIPTION="A CSL processor for Python which aims to implement the CSL 1.0.1 specification"
HOMEPAGE="https://github.com/citeproc-py/citeproc-py https://pypi.org/project/citeproc-py/"
#SRC_URI="https://github.com/citeproc-py/citeproc-py/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/versioneer[${PYTHON_USEDEP}]
	app-text/rnc2rng
"
BDEPEND=""

DOCS=( CHANGELOG.md LICENSE MANIFEST.in README.md examples/ )
# CONTRIBUTING.md ?

distutils_enable_tests pytest

src_install() {
	distutils-r1_src_install
}
