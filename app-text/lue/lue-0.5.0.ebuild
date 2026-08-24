# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..15} )

inherit distutils-r1

DESCRIPTION="Terminal ebook reader with TTS feature"
HOMEPAGE="https://github.com/paulilaaso/lue"
SRC_URI="https://github.com/paulilaaso/lue/archive/refs/tags/v${PV}.tar.gz -> ${PN}.gh.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-python/python-docx-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/striprtf-0.0.29[${PYTHON_USEDEP}]
	>=dev-python/rich-14.1.0[${PYTHON_USEDEP}]
	>=dev-python/PyMuPDF-1.26.3[${PYTHON_USEDEP}]
	>=dev-python/markdown-3.8.2[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-4.3.8[${PYTHON_USEDEP}]
	>=dev-python/edge-tts-7.2.7[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND="
	>=dev-python/setuptools-61.0
"

DOCS=( DEVELOPER.md LICENSE README.md VOICES.md images/ )

src_install() {
	distutils-r1_src_install
	dodoc -r ${DOCS}
}
