# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_{6,7} )

inherit python-any-r1 qt5-build

DESCRIPTION="The Qt toolkit is a comprehensive C++ application development framework"

if [[ ${QT5_BUILD_TYPE} == live ]]; then
	KEYWORDS=""
else
	KEYWORDS="~amd64"
fi

IUSE=""

# yep, qt-core is a build-time dep only
RDEPEND=""
DEPEND="${RDEPEND}
	${PYTHON_DEPS}
	~x11-libs/qt-core-${PV}[debug=]
	test? ( ~x11-libs/qt-gui-${PV}[debug=] )
"

pkg_setup() {
	python-any-r1_pkg_setup
	qt5-build_pkg_setup
}

src_configure() {
	# TODO: v8snapshot
	echo "QT_CONFIG -= v8snapshot" >> "${QT5_BUILD_DIR}"/.qmake.cache

	qt5-build_src_configure
}