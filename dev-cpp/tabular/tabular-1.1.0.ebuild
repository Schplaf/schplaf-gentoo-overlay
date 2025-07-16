# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Anas-Hamdane/tabular"
else
	SRC_URI="https://github.com/Anas-Hamdane/tabular/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="Lightweight, header-only C++ library for creating well-formatted, fully-customizable CLI tables."
HOMEPAGE="https://github.com/Anas-Hamdane/tabular"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc examples"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.md LICENSE CONTRIBUTING.md img/examples.png )

src_unpack() {
	default

	if [[ ${PV} == 9999 ]]; then
		git-r3_src_unpack
	fi
}

src_install() {
	use doc && DOCS+=( doc/ img/ )
	if use examples ; then
		dodoc -r examples/
	fi
	insinto /usr/include/tabular
	insinto /usr/include/tabular/single_include
	doins -r "${S}/single_include/tabular/"*
	insinto /usr/include/tabular/modular_include
	doins -r "${S}/include/tabular/"*
}
