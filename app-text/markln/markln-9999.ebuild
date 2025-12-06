# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=no
PYTHON_COMPAT=( python3_{9..13} )

inherit distutils-r1 git-r3

DESCRIPTION="A TUI MarkDown editor with live preview"
HOMEPAGE="
	https://cp737.net/blog/markln-markdown-editor-for-the-terminal
	https://github.com/xqtr/markln.git
"
#SRC_URI="https://github.com/xqtr/markln.git"
EGIT_REPO_URI="https://github.com/xqtr/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-python/textual-0.52.1[${PYTHON_USEDEP}]
	>=dev-python/pyperclip-1.8.2[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.md LICENSE )

src_install() {
	exeinto "/usr/bin"
	newexe ${PN}.py ${PN}
	dodoc ${DOCS}
}
