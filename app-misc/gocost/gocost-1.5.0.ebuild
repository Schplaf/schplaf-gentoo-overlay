# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Simple TUI application to manage monthly expenses"
HOMEPAGE="https://github.com/madalinpopa/gocost/"
SRC_URI="https://github.com/madalinpopa/gocost/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" https://gitea.com/slash/schplaf-gentoo-overlay-files/raw/tag/${P}/gocost/${P}-deps.tar.xz"

#gocost is under MIT license; 
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( LICENSE README.md docs/ )

src_compile() {
	ego build -ldflags="-s -w -X main.version=${PV}" -trimpath -o gocost ./cmd/gocost
}

src_install() {
	einstalldocs
	exeinto /usr/bin
	doexe gocost
}
