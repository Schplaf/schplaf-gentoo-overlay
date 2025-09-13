# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

MY_PN=textual_plotext
MY_P=${MY_PN}-${PV}
S=${WORKDIR}/${MY_P}

DESCRIPTION="A Textual widget wrapper library for Plotext"
HOMEPAGE="
	https://github.com/Textualize/textual-plotext/
	https://pypi.org/project/textual-plotext/
"
SRC_URI="https://github.com/Textualize/textual-plotext/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/textual-0.86.2[${PYTHON_USEDEP}]
	>=dev-python/plotext-5.2.8[${PYTHON_USEDEP}]
"
BDEPEND=""

DOCS=( LICENSE README.md )

#EPYTEST_PLUGINS=()
#distutils_enable_tests pytest

src_install() {
	distutils-r1_src_install
	dodoc -r ${DOCS}
}

