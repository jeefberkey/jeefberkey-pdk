# pdk::install::linux
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include pdk::install::linux
class pdk::install::linux {
  assert_private()

  $url = munge_pdk_url(
    $pdk::base_url,
    $pdk::dist,
    $pdk::version,
    $pdk::staging_dir,
  )

  wget::fetch { 'Download the PDK installer':
    source      => $url,
    destination => $pdk::staging_dir,
  }

}
