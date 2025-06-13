# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="A standalone Markdown renderer for the terminal"
HOMEPAGE="https://github.com/MichaelMure/mdr"
SRC_URI="
	https://github.com/MichaelMure/mdr/archive/refs/tags/v${PV}.tar.gz
	https://gitea.com/slash/schplaf-gentoo-overlay-files/raw/tag/${P}/mdr/${P}-deps.tar.xz
"
	#https://gitea.com/slash/schplaf-gentoo-overlay-files/raw/tag/${P}/mdr/${P}-vendor.tar.xz

# mdr is under MIT license, but the dependencies are under MPL-2.0, 3-Clause BSD and 2-Clause BSD
LICENSE="MIT MPL-2.0 BSD BSD-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	ego build
}

src_install() {
	einstalldocs
	dobin mdr
	default
}
