pkg_name=tk
pkg_origin=baggerspion
pkg_version="8.6.7"
pkg_maintainer="Paul Adams <paul@baggerspion.net>"
pkg_license=('custom')
pkg_dirname=${pkg_name}${pkg_version}
pkg_source="http://downloads.sourceforge.net/sourceforge/tcl/${pkg_name}${pkg_version}-src.tar.gz"
pkg_shasum="061de2a354f9b7c7d04de3984c90c9bc6dd3a1b8377bb45509f1ad8a8d6337aa"
pkg_upstream_url="http://www.tcl.tk/"
pkg_description="Tool Command Language -- A dynamic programming language."
pkg_pconfig_dirs=(lib/pkgconfig)
pkg_deps=(
  baggerspion/tcl/8.6.7/20171015124251
  core/gcc-libs 
  core/glibc 
  core/zlib
  xorg/xlib/1.6.5/20170607234030
  xorg/xproto/7.0.31/20170607233653
)
pkg_build_deps=(
  core/coreutils 
  core/diffutils
  core/gcc 
  core/make
  core/patch   
  core/sed
)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)

do_build() {
  pushd unix > /dev/null
    ./configure --prefix="$pkg_prefix" \
                --with-tcl=$(pkg_path_for baggerspion/tcl/8.6.7/20171015124251)/lib \
                --enable-threads \
                --enable-64bit
    make
  popd > /dev/null
}

do_install() {
  pushd unix > /dev/null
    make install
    make install-private-headers
  popd > /dev/null
}

do_check() {
  pushd unix > /dev/null
    make test
  popd > /dev/null
}
