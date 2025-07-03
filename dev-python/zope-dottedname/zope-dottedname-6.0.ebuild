# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_PN=${PN/-/.}
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{11..14} python3_{13..14}t pypy3_11 )

inherit distutils-r1 pypi

DESCRIPTION="Resolve strings containing dotted names into the appropriate python object"
HOMEPAGE="
	https://github.com/zopefoundation/zope.dottedname/
	https://pypi.org/project/zope.dottedname/
"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND=""
RDEPEND=""

distutils_enable_tests unittest

src_prepare() {
	# strip rdep specific to namespaces
	sed -i -e "/'setuptools'/d" setup.py || die
	distutils-r1_src_prepare
}

python_compile() {
	distutils-r1_python_compile
	find "${BUILD_DIR}" -name '*.pth' -delete || die
}

python_test() {
	cd "${BUILD_DIR}/install$(python_get_sitedir)" || die
	distutils_write_namespace zope
	eunittest
}
