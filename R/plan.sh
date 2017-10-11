pkg_name=R
pkg_origin=baggerspion
pkg_version="3.4.2"
pkg_maintainer="Paul Adams <paul@baggerspion.net>"
pkg_license=('GPL-2.0+')
pkg_source="https://cran.r-project.org/src/base/R-3/${pkg_name}-${pkg_version}.tar.gz"
pkg_shasum="971e30c2436cf645f58552905105d75788bd9733bddbcb7c4fbff4c1a6d80c64"
pkg_upstream_url="https://www.r-project.org"
pkg_description="R is a free software environment for statistical computing and graphics."
pkg_build_deps=(
  core/coreutils
  core/diffutils
  core/file
  core/make
  core/perl
  core/pkg-config
  core/texinfo
)
pkg_deps=(
  baggerspion/cairo/1.15.8/20171011134916
  core/bzip2
  core/curl
  core/gcc
  core/harfbuzz
  core/icu
  core/expat
  core/fontconfig
  core/freetype
  core/glib
  core/libjpeg-turbo
  core/liberation-fonts-ttf
  core/libpng
  core/libtiff
  core/pango
  core/pcre
  core/pixman
  core/readline
  core/xz
  core/zlib
  xorg/kbproto/1.0.7/20170607233756
  xorg/libice/1.0.9/20170607233827
  xorg/libsm/1.2.2/20170607233852
  xorg/libXau/1.0.8/20170607233814
  xorg/libXdmcp/1.1.2/20170607233905
  xorg/libXt/1.1.5/20170607234359
  xorg/libxcb/1.12/20170607233918
  xorg/libpthread-stubs/0.4/20170607233627
  xorg/xlib/1.6.5/20170607234030
  xorg/xtrans/1.3.5/20170607233805
  xorg/xproto/7.0.31/20170607233653
)
pkg_bin_dirs=(lib64/R/bin)
pkg_include_dirs=(lib64/R/include)
pkg_lib_dirs=(lib64/R/lib)

do_prepare() {
    if [[ ! -r /usr/bin/file ]]; then
        ln -sv "$(pkg_path_for file)/bin/file" /usr/bin/file
        _clean_file=true
    fi
}

do_build() {
    ./configure --prefix="${pkg_prefix}" \
		--with-x=yes \
                --disable-java \
	        --enable-memory-profiling
    make
}

do_check() {
    make test
}

do_end() {
    if [[ -n "$_clean_file" ]]; then
        rm -fv /usr/bin/file
    fi
}
