pkg_name=qt
pkg_origin=baggerspion
pkg_version="5.9.3"
pkg_maintainer="Paul Adams <paul@baggerspion.net>"
pkg_license=('LGPL-v2')
pkg_source="http://download.qt.io/official_releases/$pkg_name/5.9/$pkg_version/single/qt-everywhere-opensource-src-$pkg_version.tar.xz"
pkg_shasum="57acd8f03f830c2d7dc29fbe28aaa96781b2b9bdddce94196e6761a0f88c6046"
pkg_build_deps=(
  core/gcc
  core/make 
)
# pkg_lib_dirs=(lib)
# pkg_include_dirs=(include)
# pkg_bin_dirs=(bin)
# pkg_pconfig_dirs=(lib/pconfig)
pkg_description="Create fluid, high-performance and intuitive UIs, applications, and embedded devices – with the same code base for all platforms"
pkg_upstream_url="https://www.qt.io"
