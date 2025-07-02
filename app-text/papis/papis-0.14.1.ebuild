# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{8..13} )
inherit bash-completion-r1 distutils-r1 optfeature desktop xdg

DESCRIPTION="A powerful and highly extensible CLI document and bibliography manager"
HOMEPAGE="https://github.com/papis/papis/ https://pypi.org/project/papis/"

SRC_URI="https://github.com/papis/papis/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="bash-completion zsh-completion fish-completion rofi"

RDEPEND="
	>=dev-python/pyaml-3.12[${PYTHON_USEDEP}]
	>=dev-python/arxiv-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/beautifulsoup4-4.4.1[${PYTHON_USEDEP}]
	>=dev-python/bibtexparser-0.6.2[${PYTHON_USEDEP}]
	<dev-python/bibtexparser-2[${PYTHON_USEDEP}]
	>=dev-python/click-7.0.0[${PYTHON_USEDEP}]
	>=dev-python/colorama-0.2[${PYTHON_USEDEP}]
	>=dev-python/dominate-2.8[${PYTHON_USEDEP}]
	>=dev-python/filetype-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/habanero-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/isbnlib-3.9.1[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.3.5[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.5[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.2[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-2.2[${PYTHON_USEDEP}]
	>=dev-python/python-doi-0.1.1[${PYTHON_USEDEP}]
	>=dev-python/python-slugify-1.2.6[${PYTHON_USEDEP}]
	>=dev-python/requests-2.11.1[${PYTHON_USEDEP}]
	>=dev-python/stevedore-1.30[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.7[${PYTHON_USEDEP}]
	rofi? (
		x11-misc/rofi
		dev-python/papis-rofi[${PYTHON_USEDEP}]
	)
"
#I should add dev-python/sphinx as a dependency for documentation, but I would
# have to add a doc flag, and probably other things.

DOCS=( AUTHORS CHANGELOG.md CODE_OF_CONDUCT.md CONTRIBUTING.md HACKING.md INSTALL LICENSE doc/ README.rst )

distutils_enable_tests pytest

src_install() {
	distutils-r1_src_install
	dodoc -r ${DOCS}
	if use bash-completion
	then
		#FIXME:
		# * Problems with installed bash completions were found:
		# *
		# *      papis.bash: incorrect name, no completions for 'papis.bash' command defined.
		# *
		# * For more details on installing bash-completions, please see:
		# * https://wiki.gentoo.org/wiki/Bash/Installing_completion_files
		#should disappear when the ebuild will be fixed
		newbashcomp contrib/shell_completion/click/bash/${PN}.bash ${PN}
	fi
	if use zsh-completion
	then
		insinto /usr/share/zsh/site-functions/
		newins contrib/shell_completion/click/_${PN} _${PN}
	fi
	if use fish-completion
	then
		insinto /usr/share/fish/vendor_completions.d/
		newins contrib/shell_completion/click/fish/${PN}.fish ${PN}.fish 
	fi
}

pkg_postinst() {
	xdg_desktop_database_update
	optfeature_header "Libraries that papis knows how to interact with if installed:"
	optfeature "Jinja2Formatter" ">=dev-python/jinja2-3.0.0"
	optfeature "full text indexing, search and spell checking library" ">=dev-python/whoosh-2.7.4"
	optfeature "optional dependency of bs4, requests and feedparser and should be installed if possible" ">=dev-python/chardet-3.0.2"
	optfeature "" ">=dev-python/citeproc-py-0.6"
	optfeature "the Zenodo downloader" ">=dev-python/python-markdownify-0.11.6"
}
