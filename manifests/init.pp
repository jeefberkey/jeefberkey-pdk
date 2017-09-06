# pdk
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include pdk
class pdk (
  Stdlib::HTTPSUrl $base_url,
  Pdk::Dist $dist,
  String $version,
  Stdlib::AbsolutePath $staging_dir,
) {
  include '::pdk::install'
}
