pkg_name=crate
pkg_origin=baggerspion
pkg_version="2.2.0"
pkg_maintainer="Paul Adams <paul@baggerspion.net>"
pkg_license=('Apache-2.0')
pkg_source="https://cdn.crate.io/downloads/releases/$pkg_name-$pkg_version.tar.gz"
pkg_shasum="a15861e03897deb221e68581ea14f0159baa1b5f889360a7ceb45a28d9105912"
pkg_deps=(
  core/curl
  core/jre8
)
pkg_build_deps=(core/gnupg)
pkg_bin_dirs=(crate/bin)
pkg_lib_dirs=(crate/lib)
pkg_exports=(
  [http]=port.http
  [transport]=port.transport
  [postgres]=port.postgres
)
pkg_exposes=(http transport postgres)
pkg_upstream_url="https://crate.io"
pkg_description="CrateDB is an open source SQL database with a ground-breaking distributed design."

do_download() {
  # Download the source file, as usual
  do_default_download

  # Now also grab the signature for the source
  # Provide the checksum so that file does not get downloaded with every build
  download_file "https://cdn.crate.io/downloads/releases/${pkg_name}-${pkg_version}.tar.gz.asc" \
                "${pkg_name}-${pkg_version}.tar.gz.asc" \
                "761af928ec7985775ac3833f97a739c29a6b4bacc486cdf652fa389061dfbdfc" 
}

do_verify() {
  # Firstly perform the standard checksum-based verification
  do_default_verify

  # Now verify the signature file
  verify_file "${pkg_name}-${pkg_version}.tar.gz.asc" \
              "761af928ec7985775ac3833f97a739c29a6b4bacc486cdf652fa389061dfbdfc"

  # Now do the GPG-based verification
  build_line "Verifying crate-${pkg_version}.tar.gz signature"
  GNUPGHOME=$(mktemp -d -p "$HAB_CACHE_SRC_PATH")
  gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 90C23FC6585BC0717F8FBFC37FAAE51A06F6EAEB
  gpg --batch --verify "${HAB_CACHE_SRC_PATH}"/${pkg_name}-${pkg_version}.tar.gz.asc \
                      "${HAB_CACHE_SRC_PATH}"/${pkg_name}-${pkg_version}.tar.gz
  rm -r "$GNUPGHOME"
  build_line "Signature verified for ${pkg_name}-${pkg_version}.tar.gz"
}

do_build() {
  return 0
}

do_install() {
  mkdir -p "${pkg_prefix}"/crate
  cp -a bin lib plugins "${pkg_prefix}"/crate
  rm "${pkg_prefix}"/crate/bin/*.bat
}

do_strip() {
  return 0
}