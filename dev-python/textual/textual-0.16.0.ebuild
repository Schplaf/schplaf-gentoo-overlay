# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{9..11} )
inherit distutils-r1

DESCRIPTION="Python framework to build sophisticated UI"
HOMEPAGE="https://pypi.org/project/textual/ https://github.com/Textualize/textual"
SRC_URI="https://github.com/Textualize/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

distutils_enable_tests pytest
