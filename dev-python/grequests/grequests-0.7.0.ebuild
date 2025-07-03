# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

DESCRIPTION="Use Requests with Gevent to make asynchronous HTTP Requests easily"
HOMEPAGE="
	https://github.com/spyoungtech/grequests
	https://pypi.org/project/grequests/
"
SRC_URI="https://github.com/spyoungtech/grequests/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/gevent[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
BDEPEND=""

DOCS=( AUTHORS.rst LICENSE README.rst )

distutils_enable_tests pytest

