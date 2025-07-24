# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

MY_PN=GopherTube
MY_P=${MY_PN}-${PV}
S=${WORKDIR}/${MY_P}

DESCRIPTION="A modern TUI for searching and watching YouTube videos using mpv and chafa"
HOMEPAGE="https://github.com/KrishnaSSH/GopherTube"
SRC_URI="https://github.com/KrishnaSSH/GopherTube/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" https://gitea.com/slash/schplaf-gentoo-overlay-files/raw/tag/${P}/gophertube/${P}-deps.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

#mpv' 'fzf' 'chafa' 'yt-dlp'
DEPEND="
	net-misc/yt-dlp
	media-video/mpv
	app-shells/fzf
	media-gfx/chafa
	"

RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/go-1.21.0"

DOCS=( CONTRIBUTING.md LICENSE README.md )

src_compile() {
	ego build -ldflags="-s -w -X main.version=${PV}" -trimpath -o gophertube main.go
}

src_install() {
	einstalldocs
	doman man/gophertube.1
	exeinto /usr/bin
	doexe gophertube

}
