# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop java-pkg-2

MY_PN=Unciv
MY_P=${MY_PN}-${PV}
S=${WORKDIR}/

DESCRIPTION="Civ V remake for Android & Desktop"
HOMEPAGE="https://github.com/yairm210/Unciv"
SRC_URI="https://github.com/yairm210/Unciv/releases/download/${PV}/${MY_PN}.jar -> ${MY_P}.jar"


LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
#${DEPEND}
RDEPEND="
	|| ( virtual/jre:11 virtual/jre:17 )
"
BDEPEND=""

ICON=ExtraImages/Icons/Unciv32.png

src_unpack() {
	cp -v "${DISTDIR}/${A}" . || die
	unzip ${A} ${ICON} || die
}

src_install() {
	java-pkg_newjar "${MY_P}.jar"
	java-pkg_dolauncher "${PN}" --jar "${PN}.jar"
	newicon ${ICON} Unciv-bin-icon.png
	make_desktop_entry "${PN}" Unciv-bin Unciv-bin-icon "Game;StrategyGame;" ""
}
