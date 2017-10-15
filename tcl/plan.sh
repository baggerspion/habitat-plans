pkg_name=tcl
pkg_origin=baggerspion
pkg_version="8.6.7"
pkg_maintainer="Paul Adams <paul@baggerspion.net>"
pkg_license=('custom')
pkg_source="http://downloads.sourceforge.net/sourceforge/${pkg_name}/${pkg_name}${pkg_version}-src.tar.gz"
pkg_shasum="TODO"
pkg_upstream_url="http://www.tcl.tk/"
pkg_description="Tool Command Language -- A dynamic programming language."
pkg_deps=(
  core/gcc-libs 
  core/glibc 
  core/zlib
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
  ./configure --prefix="$pkg_prefix" \
              --enable-threads \
              --enable-64bit
  make
}

do_check() {
  make test
}