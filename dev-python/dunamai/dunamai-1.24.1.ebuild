# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

DESCRIPTION="Dynamic versioning library and CLI"
HOMEPAGE="
	https://github.com/mtkennerly/dunamai/
	https://dunamai.readthedocs.io/
	https://pypi.org/project/dunamai/
"
SRC_URI="https://github.com/mtkennerly/dunamai/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=dev-python/packaging-20.9[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"

DOCS=( CHANGELOG.md CONTRIBUTING.md LICENSE README.md docs/ )

distutils_enable_tests pytest
