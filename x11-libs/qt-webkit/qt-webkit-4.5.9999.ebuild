# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit qt4-build-edge

DESCRIPTION="The Webkit module for the Qt toolkit."
LICENSE="|| ( GPL-3 GPL-2 )"
SLOT="4"
KEYWORDS=""
IUSE=""

DEPEND="~x11-libs/qt-gui-${PV}[qt-copy=]
	~x11-libs/qt-core-${PV}[ssl,qt-copy=]
	|| ( ~x11-libs/qt-phonon-${PV}:${SLOT}[qt-copy=] media-sound/phonon )"
RDEPEND="${DEPEND}"

QT4_TARGET_DIRECTORIES="src/3rdparty/webkit/WebCore tools/designer/src/plugins/qwebview"
QT4_EXTRACT_DIRECTORIES="${QT4_TARGET_DIRECTORIES}"
QCONFIG_ADD="webkit"
QCONFIG_DEFINE="QT_WEBKIT"

src_unpack() {
	[[ $(tc-arch) == "ppc64" ]] && append-flags -mminimal-toc #241900

	qt4-build-edge_src_unpack
}

src_configure() {
	myconf="${myconf} -webkit"
	qt4-build-edge_src_configure
}
