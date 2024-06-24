# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{8..13} )
inherit distutils-r1

DESCRIPTION="A fork of epr, a CLI Ebook Reader"
HOMEPAGE="https://github.com/wustho/epy"
SRC_URI="https://github.com/wustho/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"


LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.md LICENSE )
