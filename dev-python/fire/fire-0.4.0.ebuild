# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )
inherit distutils-r1

DESCRIPTION="Library for automatically generating CLIs with a single line of code"
HOMEPAGE="https://github.com/google/python-fire"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

if [[ "${PV}" == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/google/python-fire"
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
fi

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.md )

distutils_enable_tests setup.py

src_install() {
	distutils-r1_src_install
}
