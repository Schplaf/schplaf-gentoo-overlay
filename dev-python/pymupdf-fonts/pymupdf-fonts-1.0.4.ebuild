# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1

DESCRIPTION="Collection of optional fonts for PyMuPDF"
HOMEPAGE="
	https://github.com/pymupdf/pymupdf-fonts
	https://pypi.org/project/pymupdf-fonts/
	https://pymupdf.readthedocs.io
"
SRC_URI="https://github.com/pymupdf/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"

DOCS=( README.md )
