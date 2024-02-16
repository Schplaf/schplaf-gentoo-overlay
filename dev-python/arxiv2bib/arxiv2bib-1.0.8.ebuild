# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1

DESCRIPTION="CLI tool to get metadata for academic papers arXiv.org in BibTeX format"
HOMEPAGE="https://nathangrigg.github.io/arxiv2bib"

SRC_URI="https://github.com/nathangrigg/arxiv2bib/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
BDEPEND=""

DOCS=( README.rst HISTORY.txt )

distutils_enable_tests setup.py

src_install() {
	distutils-r1_src_install
}
