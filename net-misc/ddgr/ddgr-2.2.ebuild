# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9,10,11,12} )

inherit bash-completion-r1 python-r1

DESCRIPTION="A command line utility to search DuckDuckGo from the terminal"
HOMEPAGE="https://github.com/jarun/ddgr"

if [[ "${PV}" == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jarun/${PN}.git"
else
	SRC_URI="https://github.com/jarun/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="bash-completion zsh-completion fish-completion"

DOCS=( README.md CHANGELOG LICENSE )

src_install() {
	exeinto "/usr/bin"
	doexe "${PN}"
	doman "${PN}.1"
	dodoc ${DOCS}
	if use bash-completion
	then
		newbashcomp auto-completion/bash/${PN}-completion.bash ${PN}
	fi
	if use zsh-completion
	then
		insinto /usr/share/zsh/site-functions/
		newins auto-completion/zsh/${PN} _${PN}
	fi
	if use fish-completion
	then
		insinto /usr/share/fish/vendor_completions.d/
		newins auto-completion/fish/${PN}.fish ${PN}.fish 
	fi
}
