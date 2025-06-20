# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="DeepL Translator CLI without API Key"
HOMEPAGE="https://github.com/eggplants/deepl-cli https://pypi.org/project/deepl-cli/"
#SRC_URI="https://github.com/eggplants/deepl-cli/archive/refs/tags/v${PV}.tar.gz"
SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-python/install-playwright-python-0.1[${PYTHON_USEDEP}]
	<dev-python/install-playwright-python-2[${PYTHON_USEDEP}]
	>=dev-python/playwright-python-1.49[${PYTHON_USEDEP}]
	<dev-python/playwright-python-2[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-python/hatchling[${PYTHON_USEDEP}]
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
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
