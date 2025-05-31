# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )
inherit bash-completion-r1 distutils-r1

DESCRIPTION="Tool designed to make working with multiple repositories easier"
HOMEPAGE="
	https://github.com/dirk-thomas/vcstool
	https://pypi.org/project/vcstool/
"
SRC_URI="https://github.com/dirk-thomas/vcstool/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE="bash-completion zsh-completion fish-completion"

DEPEND="
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/importlib-metadata[${PYTHON_USEDEP}]
	"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( CONTRIBUTING.md LICENSE MANIFEST.in README.rst )

distutils_enable_tests pytest

src_prepare() {
	eapply	"${FILESDIR}"/${P}-help.py-deprecation-fix.patch
	eapply_user
}

src_install() {
	distutils-r1_src_install
	dodoc -r ${DOCS}
	if use bash-completion
	then
		newbashcomp vcstool-completion/vcs.bash vcs
	fi
	if use zsh-completion
	then
		insinto /usr/share/zsh/site-functions/
		newins vcstool-completion/vcs.zsh _vcs
	fi
	if use fish-completion
	then
		insinto /usr/share/fish/vendor_completions.d/
		newins vcstool-completion/vcs.fish vcs.fish 
	fi
}
