# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module shell-completion

DESCRIPTION="Render markdown on the CLI"
HOMEPAGE="https://github.com/charmbracelet/glow"
SRC_URI="
	https://github.com/charmbracelet/glow/archive/refs/tags/v${PV}.tar.gz
	https://gitea.com/slash/schplaf-gentoo-overlay-files/raw/tag/${P}/glow/${P}-deps.tar.xz
	"
#https://gitea.com/slash/schplaf-gentoo-overlay-files/raw/tag/${P}/glow/${P}-vendor.tar.xz

# glow is under MIT license, but the dependencies are under Apache-2.0 and  3-Clause BSD
LICENSE="MIT Apache-2.0 BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE="bash-completion zsh-completion fish-completion"

BDEPEND=">=dev-lang/go-1.26.5"

src_compile() {
	ego build
}

src_install() {
	einstalldocs
	dobin glow
	if use bash-completion
	then
		glow completion bash > "${PN}"
		dobashcomp "${PN}"
	fi
	if use zsh-completion
	then
		glow completion zsh > "_${PN}"
		dozshcomp "_${PN}"
	fi
	if use fish-completion
	then
		glow completion fish > "${PN}.fish"
		dofishcomp "${PN}.fish"
	fi

	default
}
