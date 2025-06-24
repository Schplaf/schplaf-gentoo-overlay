# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A minimalist Bash script to manage your notes"
HOMEPAGE="https://github.com/joaocgduarte/nn"
EGIT_REPO_URI="https://github.com/joaocgduarte/nn"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

#fzf; glow (or your own viewer like bat, less, etc.); ripgrep (rg); git
DEPEND="
	app-shells/fzf
	|| ( sys-apps/ripgrep sys-apps/ripgrep-all )
	|| ( app-misc/glow sys-apps/bat sys-apps/less app-misc/mdr )
	dev-vcs/git
"

RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( LICENSE README.md )

src_unpack() {
	default

	if [[ ${PV} == 9999 ]]; then
		git-r3_src_unpack
	fi
}

src_install() {
	exeinto /usr/bin
	newexe ${PN} ${PN}
	dodoc -r ${DOCS}
}

pkg_postinst() {
	einfo "Configure ${PN} by editing \${HOME}/.nnconfig"
	einfo "Default directory: \${HOME}/home/notes"
	einfo "Default viewer: glow"
}
