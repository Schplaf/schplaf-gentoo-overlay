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
else
	SRC_URI="https://github.com/wustho/baca/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="${DEPEND}
	>=dev-python/beautifulsoup4-4.12.0[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
	>=dev-python/textual-0.16.0[${PYTHON_USEDEP}]
	>=dev-python/appdirs-1.4.4[${PYTHON_USEDEP}]
	>=dev-python/python-markdownify-0.11.6[${PYTHON_USEDEP}]
	>=dev-python/peewee-3.16.0[${PYTHON_USEDEP}]
	>=dev-python/fuzzywuzzy-0.18.0[${PYTHON_USEDEP}]
	>=dev-python/climage-0.2.0[${PYTHON_USEDEP}]
	"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.md LICENSE )

distutils_enable_tests pytest

src_prepare() {
	#eapply "${FILESDIR}"/baca-0.1.16_with_CLImage-0.2.0.patch
	eapply "${FILESDIR}"/baca-0.1.17-r1_with_markdownify-1.patch
	eapply_user
}

src_install() {
	distutils-r1_src_install
}
