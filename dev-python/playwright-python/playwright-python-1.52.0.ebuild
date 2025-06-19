# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..13} )

inherit distutils-r1

#A high-level API to automate web browsers
#Python version of the Playwright testing and automation library. 
DESCRIPTION="Library to automate Chromium, Firefox and WebKit browsers with a single API"
HOMEPAGE="https://playwright.dev/python/ https://github.com/microsoft/playwright-python/ https://pypi.org/project/playwright/"
SRC_URI="https://github.com/microsoft/playwright-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" https://playwright.azureedge.net/builds/driver/playwright-${PV}-linux.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/greenlet-3.1.1[${PYTHON_USEDEP}]
	<dev-python/greenlet-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyee-13[${PYTHON_USEDEP}]
	<dev-python/pyee-14[${PYTHON_USEDEP}]
"
BDEPEND=""

DOCS=( CODE_OF_CONDUCT.md CONTRIBUTING.md LICENSE README.md ROLLING.md SECURITY.md SUPPORT.md examples/ )

distutils_enable_tests pytest

pkg_setup() {
	echo "Fetch playwright-${PV}-linux.zip:"
	curl https://playwright.azureedge.net/builds/driver/playwright-${PV}-linux.zip -o ${DISTDIR}/playwright-${PV}-linux.zip
}

src_unpack() {
	echo "Unpack: mkdir ${S}/driver"
	mkdir -p ${S}/driver
	echo "Unpack: copy playwright-${PV}-linux.zip to ${S}/driver"
	cp ${DISTDIR}/playwright-${PV}-linux.zip ${S}/driver/
	#echo "Unpack: unzip playwright-${PV}-linux.zip to ${S}/driver"
	#unzip ${DISTDIR}/playwright-${PV}-linux.zip -d ${S}/driver/
	unpack ${P}.tar.gz
}

python_prepare_all() {
	eapply "${FILESDIR}"/${P}-setup.py-no_curl_call.patch
	eapply_user
	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
	distutils-r1_python_prepare_all
}

src_install() {
	distutils-r1_src_install
	dodoc -r ${DOCS}
}
