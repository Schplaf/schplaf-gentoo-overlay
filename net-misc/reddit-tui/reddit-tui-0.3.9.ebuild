# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Terminal UI for reddit"
HOMEPAGE="https://github.com/tonymajestro/reddit-tui"
SRC_URI="https://github.com/tonymajestro/reddit-tui/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" https://gitea.com/slash/schplaf-gentoo-overlay-files/raw/tag/${P}/${PN}/${P}-deps.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/go-1.16"

DOCS=( LICENSE.txt README.md )

src_compile() {
	ego build
}

src_install() {
	einstalldocs
	dobin reddittui
	default
}
