# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

DESCRIPTION="TUI podcast client for the terminal"
HOMEPAGE="https://github.com/xgi/castero"
SRC_URI="https://github.com/xgi/castero/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

#install_requires = [
#    'requests',
#    'grequests',
#    'cjkwrap',
#    'pytz',
#    'beautifulsoup4',
#    'lxml',
#    'python-vlc',
#    'python-mpv'
#]

DEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/grequests[${PYTHON_USEDEP}]
	dev-python/cjkwrap[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/python-vlc[${PYTHON_USEDEP}]
	dev-python/python-mpv[${PYTHON_USEDEP}]
	|| ( media-video/mpv media-video/vlc )
	dev-db/sqlite
	dev-python/zope-event[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
	dev-python/zope-dottedname[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( CHANGELOG.md LICENSE.txt README.md )

distutils_enable_tests pytest

