# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{7..12} )
PYTHON_REQ_USE="ncurses"

inherit distutils-r1

DESCRIPTION="A terminal user interface (TUI) for Reddit"
HOMEPAGE="https://gitlab.com/ajak/tuir"
SRC_URI="https://gitlab.com/ajak/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${PN}-v${PV}"

RDEPEND="
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/decorator[${PYTHON_USEDEP}]
	dev-python/kitchen[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/standard-mailcap[${PYTHON_USEDEP}]
"
BDEPEND="test? ( dev-python/vcrpy )"

distutils_enable_tests pytest

src_prepare() {
	eapply "${FILESDIR}"/${P}-config.py-readfp.patch
	eapply "${FILESDIR}"/${PF}-standard-mailcap_req.patch
	eapply_user
}

