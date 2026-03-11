# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
"

inherit cargo

DESCRIPTION="A Terminal UI (TUI) for testing APIs."
HOMEPAGE="https://github.com/mega123-art/PostDad/"
SRC_URI="
	https://github.com/mega123-art/PostDad/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://gitea.com/slash/schplaf-gentoo-overlay-files/raw/tag/${P}/PostDad/PostDad-${PV}-crates.tar.xz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 BSD-2 BSD Boost-1.0 CC0-1.0 MIT MPL-2.0 UoI-NCSA
	Unicode-3.0 Unicode-DFS-2016 WTFPL-2 ZLIB
"
SLOT="0"
KEYWORDS="~amd64"

DOCS=( README.md )
RUST_MIN_VER="1.90.0"

pkg_setup() {
	rust_pkg_setup
}

src_unpack() {
	if [[ "${PV}" = "9999" ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}

src_configure() {
	cargo_src_configure --offline
}

src_install() {
	einstalldocs
	cargo_src_install
}
