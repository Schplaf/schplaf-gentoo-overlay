# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1

DESCRIPTION="A TUI Ebook Reader"
HOMEPAGE="https://github.com/wustho/baca"

if [[ "${PV}" == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/wustho/baca"
	#will remove this when baca will bump the tag/version name
	DEPEND=">=dev-python/climage-0.2.0"
else
	SRC_URI="https://github.com/wustho/baca/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	DEPEND="<dev-python/climage-0.2.0"
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="${DEPEND}
	>=dev-python/beautifulsoup4-4.12.0
	dev-python/rich
	>=dev-python/textual-0.16.0
	>=dev-python/appdirs-1.4.4
	>=dev-python/python-markdownify-0.11.6
	>=dev-python/peewee-3.16.0
	>=dev-python/fuzzywuzzy-0.18.0
	"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.md LICENSE )

distutils_enable_tests pytest

src_install() {
	distutils-r1_src_install
}
