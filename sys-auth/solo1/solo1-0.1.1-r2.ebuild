# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=flit

inherit distutils-r1 eapi9-ver pypi

DESCRIPTION="CLI and Python library for SoloKeys Solo 1"
HOMEPAGE="https://github.com/solokeys/solo1-cli"
SRC_URI="https://github.com/solokeys/solo1-cli/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0 MIT"
SLOT="0"
KEYWORDS="amd64 ~riscv"

RDEPEND=">=dev-python/click-7.1.0[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/ecdsa[${PYTHON_USEDEP}]
	dev-python/fido2:0/1.0[${PYTHON_USEDEP}]
	dev-python/intelhex[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/pyusb[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]"

src_prepare() {
	# this patch has been extracted from PR #169: https://github.com/solokeys/solo1-cli/pull/169
	# link to the raw version: https://patch-diff.githubusercontent.com/raw/solokeys/solo1-cli/pull/169.patch
	eapply "${FILESDIR}"/169.patch
	eapply_user
}

pkg_postinst() {
	if ver_replacing -lt 0.1.1; then
		ewarn "Note that since version 0.1.1 the CLI executable is called '${PN}' rather than 'solo'"
		ewarn "The old name can still be used for now but is deprecated"
	fi
}
