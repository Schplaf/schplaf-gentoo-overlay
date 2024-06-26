# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="General-purpose preprocessor with customizable syntax"
HOMEPAGE="https://logological.org/gpp"
SRC_URI="https://github.com/logological/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	eapply_user
	eautoreconf
}

src_configure() {
	econf
}

src_install() {
	default
	emake DESTDIR="${D}" install
}
