# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#DISTUTILS_USE_PEP517=setuptools
DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..14} )
inherit distutils-r1

if [[ ${PV} != 9999 ]]; then
	SRC_URI="https://github.com/jmaupetit/md2pdf/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
else
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jmaupetit/md2pdf.git"
fi

DESCRIPTION="A markdown to PDF conversion tool"
HOMEPAGE="
	https://github.com/jmaupetit/md2pdf
	https://pypi.org/project/md2pdf
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

#for cli support, add cli USE flag. When used as a Pythnon library, no need to enable this flag.
IUSE="cli"

#optional dependencies:
# - cli -> typer + watchfiles
# - latex-> >=markdown-katex-202406.1035 (?)
#TODO: latex? ( dev-python/markdown-katex )
DEPEND="
	>=dev-python/jinja2-3.0[${PYTHON_USEDEP}]
	|| ( dev-python/markdown2[${PYTHON_USEDEP}] >=dev-python/markdown-3.5[${PYTHON_USEDEP}] )
	>=dev-python/pygments-2.17[${PYTHON_USEDEP}]
	>=dev-python/weasyprint-60.0[${PYTHON_USEDEP}]
	>=dev-python/python-frontmatter-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/pymdown-extensions-10.0[${PYTHON_USEDEP}]
	cli? (
		>=dev-python/typer-0.21.1[${PYTHON_USEDEP}]
		>=dev-python/watchfiles-1.1.1[${PYTHON_USEDEP}]
	)
"

RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.md LICENSE CHANGELOG.md examples/ assets/ )

distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare
	dodoc -r ${DOCS}
}
