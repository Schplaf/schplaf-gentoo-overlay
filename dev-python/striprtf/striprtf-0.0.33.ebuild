# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1 pypi

DESCRIPTION="Library to strip rtf to plain text"
HOMEPAGE="
	https://github.com/joshy/striprtf/
	https://pypi.org/project/striprtf/
"
SRC_URI="https://github.com/joshy/striprtf/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
	>=dev-python/hatchling-1.21[${PYTHON_USEDEP}]
	<dev-python/hatchling-1.32[${PYTHON_USEDEP}]
"

DOCS=( README.md DEVELOPMENT.md CHANGELOG.md LICENSE )

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
