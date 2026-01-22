# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Simple shell script to search for YouTube videos from your terminal"
HOMEPAGE="https://github.com/Stan-breaks/ytsurf"
SRC_URI="https://github.com/Stan-breaks/ytsurf/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="rofi syncplay"

#Required: bash, yt-dlp, jq, curl, mpv, fzf, chafa, ffmpeg (for fzf thumbnails)
# Optional: rofi, sentaku, syncplay
DEPEND="
	app-shells/bash
	net-misc/yt-dlp
	app-misc/jq
	net-misc/curl
	media-video/mpv
	app-shells/fzf
	media-gfx/chafa
	media-video/ffmpeg
	rofi? ( x11-misc/rofi )
	syncplay? ( media-video/syncplay )
	"
	# how to specify a dependency from another overlay? (net-misc/xh from guru overlay)

RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.md CONTRIBUTING.md FUTURE_FEATURES.md LICENSE )

src_install() {
	exeinto /usr/bin
	newexe ${PN}.sh ${PN}
	dodoc -r ${DOCS}
}
