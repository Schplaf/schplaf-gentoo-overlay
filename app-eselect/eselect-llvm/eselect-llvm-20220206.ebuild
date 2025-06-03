# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Manage LLVM versions"
HOMEPAGE="https://github.com/Infrasonics/eselect-llvm"
SRC_URI="https://github.com/Infrasonics/eselect-llvm/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="app-admin/eselect"

DOCS=( README.md LICENSE )

#patch from https://github.com/xz-dev/eselect-llvm/archive/refs/tags/${PV}.tar.gz
src_prepare() {
	eapply "${FILESDIR}"/${P}.patch
	eapply_user
}

src_install() {
	insinto /usr/share/eselect/modules
	doins llvm.eselect
	einstalldocs
}

