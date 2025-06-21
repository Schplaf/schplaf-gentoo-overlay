# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{9..13} )
inherit distutils-r1 optfeature

DESCRIPTION="Python framework to build sophisticated UI"
HOMEPAGE="https://pypi.org/project/textual/ https://github.com/Textualize/textual"
SRC_URI="https://github.com/Textualize/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="rust-speedups"

DEPEND="
	>=dev-python/rich-13.3.3[${PYTHON_USEDEP}]
	>=dev-python/markdown-it-py-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.4.0[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-3.6.0[${PYTHON_USEDEP}]
	<dev-python/platformdirs-5[${PYTHON_USEDEP}]
	rust-speedups? ( dev-python/textual-speedups[${PYTHON_USEDEP}] )
"
	#>=dev-python/importlib-metadata-4.11.3[${PYTHON_USEDEP}]
RDEPEND="${DEPEND}"
BDEPEND=""

distutils_enable_tests pytest

DOCS=( README.md CHANGELOG.md LICENSE CODE_OF_CONDUCT.md CONTRIBUTING.md docs.md docs/ imgs/ questions/ notes/ examples/ )

src_install() {
	distutils-r1_src_install
	dodoc -r ${DOCS}
}

pkg_postinst() {
	optfeature_header "Extra syntax support:"
	optfeature "bindings for python" ">=dev-python/tree-sitter-0.23.0"
	optfeature "bindings for python" ">=dev-libs/tree-sitter-python-0.23.0"
	optfeature "bindings for markdown" ">=dev-libs/tree-sitter-markdown-0.23.0"
	optfeature "bindings for json" ">=dev-libs/tree-sitter-json-0.23.0"
	optfeature "bindings for toml" ">=dev-libs/tree-sitter-toml-0.23.0"
	optfeature "bindings for yaml" ">=dev-libs/tree-sitter-yaml-0.23.0"
	optfeature "bindings for html" ">=dev-libs/tree-sitter-html-0.23.0"
	optfeature "bindings for css" ">=dev-libs/tree-sitter-css-0.23.0"
	optfeature "bindings for javascript" ">=dev-libs/tree-sitter-javascript-0.23.0"
	optfeature "bindings for rust" ">=dev-libs/tree-sitter-rust-0.23.0 and <=dev-libs/tree-sitter-rust-0.23.2"
	optfeature "bindings for go" ">=dev-libs/tree-sitter-go-0.23.0"
	optfeature "bindings for regex" ">=dev-libs/tree-sitter-regex-0.23.0"
	optfeature "bindings for xml" ">=dev-libs/tree-sitter-xml-0.23.0"
	optfeature "bindings for sql" ">=dev-libs/tree-sitter-sql-0.23.0"
	optfeature "bindings for java" ">=dev-libs/tree-sitter-java-0.23.0"
	optfeature "bindings for bash" ">=dev-libs/tree-sitter-bash-0.23.0"
}

