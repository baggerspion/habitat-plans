pkg_name=tcl
pkg_origin=baggerspion
pkg_version="8.6.7"
pkg_maintainer="Paul Adams <paul@baggerspion.net>"
pkg_license=('custom')
pkg_dirname=${pkg_name}${pkg_version}
pkg_source="http://downloads.sourceforge.net/sourceforge/${pkg_name}/${pkg_name}${pkg_version}-src.tar.gz"
pkg_shasum="7c6b8f84e37332423cfe5bae503440d88450da8cc1243496249faa5268026ba5"
pkg_upstream_url="http://www.tcl.tk/"
pkg_description="Tool Command Language -- A dynamic programming language."
pkg_pconfig_dirs=(lib/pkgconfig)
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
  pushd unix > /dev/null
    ./configure --prefix="$pkg_prefix" \
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
