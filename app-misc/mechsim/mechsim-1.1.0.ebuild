# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN=MechSim
MY_P=${MY_PN}-${PV}
S=${WORKDIR}/${MY_P}

DESCRIPTION="A CLI-Based Mechanical Keyboard Sound Simulator"
HOMEPAGE="https://github.com/cjlangan/MechSim"
SRC_URI="https://github.com/cjlangan/MechSim/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="
	dev-libs/json-c
	dev-libs/libevdev
	dev-libs/libinput
	media-libs/libpulse
	media-libs/libsndfile
	virtual/libudev
"
BDEPEND="sys-devel/gcc"

DOCS=( README.md )

DIRBIN=/usr/bin
DIRAUDIO=/usr/share/mechsim

src_install() {
	exeinto ${DIRBIN}
	doexe mechsim
	doexe keyboard_sound_player
	doexe get_key_presses

	dodir ${DIRAUDIO}
	insinto ${DIRAUDIO}
	doins -r audio

	dodoc ${DOCS}
}

