# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit git-r3

DESCRIPTION="A libpurple/Pidgin plugin for Discord"
HOMEPAGE="https://github.com/EionRobb/purple-discord"
EGIT_REPO_URI="https://github.com/EionRobb/purple-discord"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-vcs/git
	dev-libs/json-glib
	net-im/pidgin
"
RDEPEND="${DEPEND}"
#BDEPEND=""
