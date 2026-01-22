# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Utility to make sentaku (selection, 選択(sentaku)) window with shell command."
HOMEPAGE="https://github.com/rcmdnk/sentaku https://rcmdnk.com/blog/2014/01/24/computer-bash-zsh/"
SRC_URI="https://github.com/rcmdnk/sentaku/archive/refs/tags/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.md LICENSE bin/ex_emacs.sh bin/ex_explorer.sh bin/ex_menu.sh bin/ex_pipe.sh bin/ex_slime.sh bin/ex_source_bash.sh bin/ex_source_zsh.sh bin/file_selector )


src_install(){
	exeinto /usr/bin
	newexe bin/${PN} ${PN}
	dodoc -r ${DOCS}
}
