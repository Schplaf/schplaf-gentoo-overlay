# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..13} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1

DESCRIPTION="Converts a CSV file with event information to an iCalendar ICS file"
HOMEPAGE="https://github.com/rlan/csv2ical"
if [[ "${PV}" == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rlan/cvs2ical"
else
	SRC_URI="https://github.com/rlan/csv2ical/archive/refs/tags/${PV}.tar.gz"
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-python/icalendar-4.0.1[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.md LICENSE sample.csv sample.ics CITATION.cff )

#TODO: test
#[tool.hatch.envs.hatch-test.scripts]
#run = "csv2ical sample.csv test.ics && diff sample.ics test.ics"

#src_install() {
#	exeinto "/usr/bin"
#	newexe ${PN}.py ${PN}
#	dodoc ${DOCS}
#}
