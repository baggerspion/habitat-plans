pkg_name=cairo
pkg_origin=baggerspion
pkg_version="1.15.8"
pkg_maintainer="Paul Adams <paul@baggerspion.net>"
pkg_license=(
  'LGPL-2.1'
  'MPL-1.1'
)
pkg_source="http://cairographics.org/snapshots/$pkg_name-$pkg_version.tar.xz"
pkg_shasum="3224260a4f8e22e7ea95faf706ae111b974833dd74185be1db5ebc7618a98464"
pkg_description="Cairo is a 2D graphics library with support for multiple output devices."
pkg_upstream_url="https://www.cairographics.org"
pkg_deps=(
  core/expat
  core/fontconfig
  core/freetype
  core/glib
  core/libpng
  core/pcre
  core/pixman
  core/zlib
  xorg/kbproto/1.0.7/20170607233756
  xorg/libXau/1.0.8/20170607233814
  xorg/libXdmcp/1.1.2/20170607233905
  xorg/libpthread-stubs/0.4/20170607233627
  xorg/libxrender/0.9.10/20170607234342
  xorg/libxcb/1.12/20170607233918
  xorg/renderproto/0.11.1/20170607233728
  xorg/xcb-proto/1.12/20170607233734
  xorg/xlib/1.6.5/20170607234030
  xorg/xproto/7.0.31/20170607233653
)
pkg_build_deps=(
  core/diffutils
  core/gcc
  core/make
  core/pkg-config
)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include/cairo)
pkg_lib_dirs=(
  lib
  lib/cairo
)
pkg_pconfig_dirs=(lib/pkgconfig)

do_build() {
  CFLAGS="-Os ${CFLAGS}"

  ./configure --prefix="${pkg_prefix}" \
              --with-x=yes
  make
}

do_check() {
  make test
}
