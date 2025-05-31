# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 )

inherit distutils-r1 git-r3

DESCRIPTION="A \"temporary\" solution to compensate for the end of imghdr in Python3.13"
HOMEPAGE="https://github.com/mikeshardmind/imghdr-lts"
EGIT_REPO_URI="https://github.com/mikeshardmind/${PN}.git"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=""
BDEPEND=""

DOCS=( LICENCE README.md )

pkg_postinst() {
	einfo "This package is a \"totally temporary\" solution"
	einfo "you should fix your software instead of using it."
	einfo "But, well, I understand you use it \"temporary\""
}
