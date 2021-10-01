# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A complete monitor of machine resources"
HOMEPAGE="https://github.com/aristocratos/btop"
SRC_URI="https://github.com/aristocratos/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"


LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=sys-devel/gcc-10"

src_prepare() {
	default
}

src_compile() {
	emake 
}

src_install() {
	emake PREFIX="${EPREFIX}/usr" DESTDIR="${D}" install
	dodoc README.md CHANGELOG.md
}
