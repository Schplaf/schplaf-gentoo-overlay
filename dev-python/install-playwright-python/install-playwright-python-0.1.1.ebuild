# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{9..13} )

inherit distutils-r1

MY_PN=install_playwright_python
MY_P=${MY_PN}-${PV}
S=${WORKDIR}/${P}

DESCRIPTION="Execute \`playwright install\` from Python"
HOMEPAGE="https://github.com/eggplants/install-playwright-python https://pypi.org/project/install-playwright/"
SRC_URI="https://github.com/eggplants/install-playwright-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/playwright-python-1.49.1[${PYTHON_USEDEP}]
	<dev-python/playwright-python-2[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/uv-build[${PYTHON_USEDEP}]
	dev-python/uv-dynamic-versioning[${PYTHON_USEDEP}]
"

DOCS=( LICENSE README.md )

distutils_enable_tests pytest

python_prepare_all() {
	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
	distutils-r1_python_prepare_all
}

src_install() {
	distutils-r1_src_install
	dodoc -r ${DOCS}
}
