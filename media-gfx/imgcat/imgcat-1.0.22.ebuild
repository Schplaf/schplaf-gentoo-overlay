# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Display images and gifs in your terminal"
HOMEPAGE="https://github.com/danielgatis/imgcat"
SRC_URI="https://github.com/danielgatis/imgcat/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" https://gitea.com/slash/schplaf-gentoo-overlay-files/raw/tag/${P}/imgcat/${P}-deps.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( LICENSE README.md )

src_compile() {
	ego build
}

src_install() {
	einstalldocs
	dobin imgcat
	default
}
