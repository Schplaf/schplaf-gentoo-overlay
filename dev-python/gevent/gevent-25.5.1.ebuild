# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )
PYTHON_REQ_USE="ssl(+),threads(+)"

inherit distutils-r1 pypi flag-o-matic

DESCRIPTION="Coroutine-based concurrency library for Python"
HOMEPAGE="
	http://gevent.org/
	https://github.com/gevent/gevent/
	https://pypi.org/project/gevent/
"
SRC_URI="https://github.com/gevent/gevent/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
#SRC_URI="$(pypi_sdist_url "${PN^}" "${PV}")"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
#TOFIX: try to make tests work
RESTRICT="test"

RDEPEND="
	>=dev-libs/libev-4.31
	dev-libs/libuv
	>=net-dns/c-ares-1.12
	>=dev-python/greenlet-3.2.2[${PYTHON_USEDEP}]
	>=dev-python/cffi-1.17.1[${PYTHON_USEDEP}]
	>=dev-python/cython-3.0.11[${PYTHON_USEDEP}]
"
BDEPEND=""

DOCS=( AUTHORS CHANGES.rst CONTRIBUTING.rst LICENSE NOTICE README.rst examples )

#distutils_enable_tests pytest

python_prepare_all() {
	export GEVENTSETUP_EMBED="false"
	distutils-r1_python_prepare_all
}

python_configure_all() {
	append-flags -fno-strict-aliasing
}

python_install_all() {
	dodoc -r ${DOCS}
	distutils-r1_python_install_all
}
