# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

MY_PN=standard_mailcap
MY_P=${MY_PN}-${PV}
S=${WORKDIR}/${MY_P}

DESCRIPTION="Standard library mailcap redistribution. \"dead battery\".(removed in Python-3.13)"
HOMEPAGE="https://github.com/youknowone/python-deadlib https://pypi.org/project/standard-mailcap/"
SRC_URI="https://github.com/youknowone/python-deadlib/releases/download/v3.13.0/standard_mailcap-${PV}.tar.gz"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND=">=dev-python/setuptools-69.0[${PYTHON_USEDEP}]"

DOCS=( README.rst LICENSE )

distutils_enable_tests pytest
