# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit cmake-utils

DESCRIPTION="Library used to create an internal representation of an API in order to create Python bindings"
HOMEPAGE="http://www.pyside.org/"
SRC_URI="http://www.pyside.org/files/lib${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

RDEPEND=">=dev-libs/boost-1.38.0
	dev-libs/libxml2
	dev-libs/libxslt
	>=x11-libs/qt-core-4.5.0
	>=x11-libs/qt-xmlpatterns-4.5.0"

DEPEND="${RDEPEND}
	dev-util/pkgconfig"

S="${WORKDIR}/lib${P}"

src_prepare() {
	sed -e 's:share/cmake-2.6/Modules:share/cmake/Modules:' \
		-e '/^install/s/lib/lib${LIB_SUFFIX}/' \
		-i "${S}/CMakeLists.txt" || die "sed failed"
}
