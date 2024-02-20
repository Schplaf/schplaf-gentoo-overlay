# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )
inherit bash-completion-r1 distutils-r1

DESCRIPTION="A powerful and highly extensible CLI document and bibliography manager"
HOMEPAGE="https://github.com/papis/papis/ https://pypi.org/project/papis/"

SRC_URI="https://github.com/papis/papis/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="bash-completion zsh-completion fish-completion"

RDEPEND="
	>=dev-python/pyaml-3.12[${PYTHON_USEDEP}]
	>=dev-python/arxiv2bib-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/beautifulsoup4-4.4.1[${PYTHON_USEDEP}]
	>=dev-python/bibtexparser-1.4[${PYTHON_USEDEP}]
	<dev-python/bibtexparser-2[${PYTHON_USEDEP}]
	>=dev-python/chardet-3.0.2[${PYTHON_USEDEP}]
	>=dev-python/click-7.0.0[${PYTHON_USEDEP}]
	>=dev-python/colorama-0.2[${PYTHON_USEDEP}]
	dev-python/dominate[${PYTHON_USEDEP}]
	>=dev-python/filetype-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/habanero-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/isbnlib-3.9.1[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.3.5[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/python-doi-0.1.1[${PYTHON_USEDEP}]
	>=dev-python/python-slugify-1.2.6[${PYTHON_USEDEP}]
	>=dev-python/requests-2.11.1[${PYTHON_USEDEP}]
	>=dev-python/stevedore-1.30[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.1[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.7[${PYTHON_USEDEP}]
"

DOCS=( AUTHORS CONTRIBUTING.md CHANGELOG.md CODE_OF_CONDUCT.md HACKING.md INSTALL LICENSE doc/ )

distutils_enable_tests pytest

src_install() {
	distutils-r1_src_install
	dodoc -r ${DOCS}
	if use bash-completion
	then
		newbashcomp scripts/shell_completion/click/bash/${PN}.bash ${PN}
	fi
	if use zsh-completion
	then
		insinto /usr/share/zsh/site-functions/
		newins scripts/shell_completion/click/_${PN} _${PN}
	fi
	if use fish-completion
	then
		insinto /usr/share/fish/vendor_completions.d/
		newins scripts/shell_completion/click/fish/${PN}.fish ${PN}.fish 
	fi
}

#should disappear when the ebuild will be fixed
pkg_postinst() {
	#why does it create /usr/share/doc/papis/ in addition to /usr/share/doc/papis-0.13/?
	rm -r /usr/share/doc/papis/
}
