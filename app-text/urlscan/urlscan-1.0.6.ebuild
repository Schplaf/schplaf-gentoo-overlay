# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="Mutt and terminal url selector (similar to urlview)"
HOMEPAGE="
	https://github.com/firecat53/urlscan
	https://pypi.org/project/urlscan/
"
SRC_URI="https://github.com/firecat53/urlscan/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=">=dev-python/urwid-1.2.1[${PYTHON_USEDEP}]"

DOCS=( ${PN}.1 README.md LICENSE )

python_prepare_all() {
	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
	distutils-r1_python_prepare_all
}

#python_install_all() {
#	distutils-r1_python_install_all
#	dodoc -r ${DOCS}
#}
