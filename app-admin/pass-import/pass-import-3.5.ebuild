# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{{11..13},13t} )

inherit bash-completion-r1 distutils-r1 pypi

MY_PN=pass-import
MY_P=${MY_PN}-${PV}
S=${WORKDIR}/${MY_P}

DESCRIPTION="A pass extension for importing data from most existing password managers"
HOMEPAGE="
	https://github.com/roddhjav/pass-import/
	https://www.passwordstore.org/
	"
SRC_URI="https://github.com/roddhjav/pass-import/releases/download/v${PV}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="bash-completion zsh-completion"
#TODO: add IUSE flags for each importer (?)  lastpass, keepass, gnomekeyring, AndOTPaegis, sphinx, + filter exports

DEPEND=">=app-admin/pass-1.7.0"
RDEPEND="${DEPEND}"

DOCS=( CHANGELOG.md CONTRIBUTING.md LICENSE README.md )

distutils_enable_tests unittest

src_install() {
	distutils-r1_src_install

	doman share/man/man1/pass-import.1
	doman share/man/man1/pimport.1

	dodoc ${DOCS}

	OTHERNAME="pimport" 
	if use bash-completion
	then
		newbashcomp share/bash-completion/completions/${PN} ${PN}
		newbashcomp share/bash-completion/completions/${OTHERNAME} ${OTHERNAME}
	fi
	if use zsh-completion
	then
		insinto /usr/share/zsh/site-functions/
		newins share/zsh/site-functions/${PN} _${PN}
		newins share/zsh/site-functions/${OTHERNAME} _${OTHERNAME}
	fi

	exeinto /usr/lib/password-store/extensions
	doexe import.bash
}
