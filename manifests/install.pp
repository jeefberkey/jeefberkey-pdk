# pdk::install
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include pdk::install
class pdk::install {
  assert_private()

  package { 'pdk':
    ensure   => $pdk::package_ensure,
    source   => "${pdk::staging_dir}/pdk-installer",
    provider => $pdk::package_provider,
  }

}
