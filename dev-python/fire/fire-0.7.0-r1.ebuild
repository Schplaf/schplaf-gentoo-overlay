# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )
inherit distutils-r1

MY_PN=python-${PN}
MY_P=${MY_PN}-${PV}
S=${WORKDIR}/${MY_P}

DESCRIPTION="Library for automatically generating CLIs from any Python object"
HOMEPAGE="
	https://github.com/google/python-fire
	https://pypi.org/project/fire/"

if [[ "${PV}" == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/google/python-fire"
else
	SRC_URI="https://github.com/google/python-fire/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.tar.gz"
fi

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="dev-python/termcolor[${PYTHON_USEDEP}]"
BDEPEND="test? (
	dev-python/hypothesis[${PYTHON_USEDEP}]
	dev-python/levenshtein[${PYTHON_USEDEP}]
)"

DOCS=( CONTRIBUTING.md LICENSE MANIFEST.in README.md docs/ )

distutils_enable_tests pytest

src_install() {
	distutils-r1_src_install
}
