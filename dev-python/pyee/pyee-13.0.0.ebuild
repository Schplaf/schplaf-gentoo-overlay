# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..13} )

inherit distutils-r1 pypi

DESCRIPTION="A rough port of Node.js's EventEmitter to Python with a few tricks of its own"
HOMEPAGE="https://github.com/jfhbrook/pyee https://pypi.org/project/pyee/"
SRC_URI="https://github.com/jfhbrook/pyee/archive/refs/tags/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/typing-extensions[${PYTHON_USEDEP}]"
BDEPEND=""

DOCS=( CHANGELOG.md CONTRIBUTORS.md DEVELOPMENT.md LICENSE MANIFEST.in README.md docs/ )

distutils_enable_tests pytest

src_install() {
	distutils-r1_src_install
	dodoc -r ${DOCS}
}
