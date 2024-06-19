# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7,8,9,10,11,12} )
DISTUTILS_USE_PEP517=no
inherit git-r3 distutils-r1

DESCRIPTION="Converts a CSV file with event information to an iCalendar ICS file"
HOMEPAGE="https://github.com/rlan/csv2ical"
EGIT_REPO_URI="https://github.com/rlan/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=">=dev-python/icalendar-4.0.1[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.md LICENSE sample.csv sample.ics )

src_install() {
	exeinto "/usr/bin"
	newexe ${PN}.py ${PN}
	dodoc ${DOCS}
}
