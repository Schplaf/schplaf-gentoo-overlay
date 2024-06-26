# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13})
inherit distutils-r1

DESCRIPTION="Library to manipulate OpenDocument files (pyexcel version)"
HOMEPAGE="https://github.com/pyexcel/pyexcel-ezodf"
SRC_URI="https://github.com/pyexcel/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-python/lxml"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.rst CHANGELOG.rst CONTRIBUTORS.rst docs/ )


distutils_enable_tests setup.py

src_install() {
	distutils-r1_src_install
}
