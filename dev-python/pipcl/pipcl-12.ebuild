# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..15} )
DISTUTILS_USE_PEP517=standalone

inherit distutils-r1

DESCRIPTION="Python packaging operations tool used by ArtifexSoftware projects"
HOMEPAGE="https://github.com/ArtifexSoftware/pipcl"
SRC_URI="https://github.com/ArtifexSoftware/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="dev-python/packaging[${PYTHON_USEDEP}]"

DOCS=( README.rst )

#QA notice asked to add it...
RESTRICT="test"
