# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

DESCRIPTION="Low level client for Crossref search API"
HOMEPAGE="https://github.com/sckott/habanero/https://pypi.org/project/habanero/"

SRC_URI="https://github.com/sckott/habanero/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
BDEPEND=""

#DOCS=( Changelog.md LICENSE README.rst CODE_OF_CONDUCT.md )

distutils_enable_tests pytest

src_install() {
	distutils-r1_src_install
}
