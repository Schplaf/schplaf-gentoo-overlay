# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs optfeature

DESCRIPTION="A complete monitor of machine resources"
HOMEPAGE="https://github.com/aristocratos/btop"
SRC_URI="https://github.com/aristocratos/btop/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"


LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="|| ( >=sys-devel/gcc-10 >=sys-devel/clang-16.0.0 )"

src_prepare() {
	default
}

#TODO: I should add something here to manage the GPU compatibility
#+ may also need dependencies
#src_configure() {
#	GPU_SUPPORT / -DBTOP_GPU ; default=true
#	RSMI_STATIC / -DBTOP_RSMI_STATIC ; AMD, default=true
#	FORTIFY_SOURCE ; default=false
#}

src_compile() {
	emake
}

src_install() {
	emake PREFIX="${EPREFIX}/usr" DESTDIR="${D}" install
	dodoc README.md CHANGELOG.md
}
