# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{9..12} )
inherit distutils-r1

DESCRIPTION="Python framework to build sophisticated UI"
HOMEPAGE="https://pypi.org/project/textual/ https://github.com/Textualize/textual"
SRC_URI="https://github.com/Textualize/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-python/rich-13.3.3
	>=dev-python/markdown-it-py-2.1.0
	>=dev-python/typing-extensions-4.4.0
	>=dev-python/importlib-metadata-4.11.3
"
RDEPEND="${DEPEND}"
BDEPEND=""

distutils_enable_tests pytest

DOCS=( README.md CHANGELOG.md LICENSE CODE_OF_CONDUCT.md CONTRIBUTING.md docs.md docs/ imgs/ questions/ notes/ examples/ )

src_install() {
	distutils-r1_src_install
	dodoc -r ${DOCS}
}
