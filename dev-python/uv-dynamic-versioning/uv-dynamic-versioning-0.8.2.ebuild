# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{9..13} )

inherit distutils-r1 pypi

MY_PN=uv-dynamic-versioning
MY_P=${MY_PN}-${PV}
S=${WORKDIR}/${MY_P}

DESCRIPTION="Dynamic versioning based on VCS tags for uv/hatch project"
HOMEPAGE="https://github.com/ninoseki/uv-dynamic-versioning/ https://pypi.org/project/uv-dynamic-versioning/"
SRC_URI="https://github.com/ninoseki/uv-dynamic-versioning/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

#>=dev-python/eval-type-backport-0.2  + <python_version-3.10
RDEPEND="
	>=dev-python/dunamai-1.23[${PYTHON_USEDEP}]
	>=dev-python/eval-type-backport-0.2[${PYTHON_USEDEP}]
	>=dev-python/hatchling-1.26[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.10[${PYTHON_USEDEP}]
	>=dev-python/tomlkit-0.13[${PYTHON_USEDEP}]
"
BDEPEND=""

DOCS=( LICENSE README.md )

distutils_enable_tests pytest
