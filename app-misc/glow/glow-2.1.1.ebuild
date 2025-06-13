# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

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

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	ego build
}

src_install() {
	einstalldocs
	dobin glow
	default
}
