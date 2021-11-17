# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit multilib-minimal

DESCRIPTION="Implementation of the S3 Texture Compression"
HOMEPAGE="https://web.archive.org/web/20200923055707/https://cgit.freedesktop.org/~mareko/libtxc_dxtn/"
SRC_URI="https://people.freedesktop.org/~cbrill/${PN}/${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="media-libs/mesa"
RDEPEND="${DEPEND}"
BDEPEND=""

multilib_src_configure() {
	ECONF_SOURCE="${S}" econf
}

multilib_src_install_all() {
	default

	# libtxc_dxtn is installed as a module (plugin)
	find "${D}" -name '*.la' -delete || die
}

