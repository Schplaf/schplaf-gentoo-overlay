# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module systemd

DESCRIPTION="A personal DNS server designed to solve problems associated with VPN use"
HOMEPAGE="https://github.com/jkerdreux-imt/owns"


if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jkerdreux-imt/owns"
else
	SRC_URI="https://github.com/jkerdreux-imt/owns/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	SRC_URI+=" https://gitea.com/slash/schplaf-gentoo-overlay-files/raw/tag/${P}/owns/${P}-deps.tar.xz"
fi

LICENSE="BSD" # "BSD-3 Clause"
SLOT="0"
KEYWORDS="~amd64"

IUSE="systemd"

DEPEND="systemd? ( sys-apps/systemd )"
RDEPEND="${DEPEND}"
BDEPEND=">=dev-lang/go-1.21.0"

DOCS=( README.md )

src_compile() {
	ego build
}

src_install() {
	dobin owns
	dodoc ${DOCS}
	insinto /etc/owns
	doins -r conf/*

	if use systemd; then
		insinto /usr/lib/systemd/system
		doins ${PN}.service
	else
		echo ""
	fi
}
