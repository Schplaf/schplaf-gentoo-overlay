# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="Low level client for Crossref search API"
HOMEPAGE="https://github.com/sckott/habanero/ https://pypi.org/project/habanero/"

SRC_URI="https://github.com/sckott/habanero/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="bibtex"

DEPEND="
	>=dev-python/httpx-0.27.2
	>=dev-python/packaging-24.1
	>=dev-python/pyyaml-6.0.2
	>=dev-python/tqdm-4.66.5
	>=dev-python/urllib3-2.2.0
	bibtex? ( dev-python/bibtexparser )
"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( Changelog.rst LICENSE.md README.rst MANIFEST.in CODE_OF_CONDUCT.md )

distutils_enable_tests pytest

src_install() {
	distutils-r1_src_install
	dodoc -r ${DOCS}
}
