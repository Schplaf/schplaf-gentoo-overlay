# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..13} )

inherit distutils-r1

MY_PN=eval_type_backport
MY_P=${MY_PN}-${PV}
S=${WORKDIR}/${MY_P}

DESCRIPTION="Replacement for typing._eval_type to support newer typing features in older Python versions"
HOMEPAGE="https://github.com/alexmojaki/eval_type_backport https://pypi.org/project/eval-type-backport/"
SRC_URI="https://github.com/alexmojaki/eval_type_backport/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND="" #dev-python/setuptools[${PYTHON_USEDEP}]

DOCS=( LICENSE.txt README.md )

distutils_enable_tests pytest

python_prepare_all() {
	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
	distutils-r1_python_prepare_all
}

