# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CARGO_OPTIONAL=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{12..13} )

CRATES="
	autocfg@1.4.0
	geometry@0.2.0
	heck@0.5.0
	indoc@2.0.6
	libc@0.2.172
	memoffset@0.9.1
	once_cell@1.21.3
	portable-atomic@1.11.0
	proc-macro2@1.0.95
	pyo3-build-config@0.25.0
	pyo3-ffi@0.25.0
	pyo3-macros-backend@0.25.0
	pyo3-macros@0.25.0
	pyo3@0.25.0
	quote@1.0.40
	range@0.2.0
	syn@2.0.101
	target-lexicon@0.13.2
	unicode-ident@1.0.18
	unindent@0.2.4
	wavefront_obj@2.0.4
"

inherit cargo distutils-r1 pypi #git-r3

DESCRIPTION="Optional Rust speedups for Textual (dev-python/textual)"

#EGIT_REPO_URI="https://github.com/willmcgugan/textual-speedups.git"
#mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz
SRC_URI="
	$(pypi_sdist_url "${PN^}" "${PV}")
	$(cargo_crate_uris ${CRATES})
"
HOMEPAGE="
	https://github.com/willmcgugan/textual-speedups
	https://pypi.org/project/textual-speedups/
"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+=" Apache-2.0-with-LLVM-exceptions MIT Unicode-3.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
BDEPEND="
	>=dev-util/maturin-1.8
	<dev-util/maturin-2.0
"
	#dev-python/setuptools-rust[${PYTHON_USEDEP}]

# Rust does not respect CFLAGS/LDFLAGS
QA_FLAGS_IGNORED=".*/_rust.*"

src_unpack() {
	cargo_src_unpack
}
