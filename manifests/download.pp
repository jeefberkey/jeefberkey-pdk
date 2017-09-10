# Download the PDK installer
class pdk::download {
  assert_private()

  $url = pdk::munge_pdk_url(
    $pdk::base_url,
    $pdk::dist,
    $pdk::version,
    $pdk::staging_dir,
  )

  remote_file { "${pdk::staging_dir}/pdk-installer":
    ensure => present,
    source => $url,
  }

}
