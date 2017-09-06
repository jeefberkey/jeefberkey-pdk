class pdk::download {
  assert_private()

  $url = pdk::munge_pdk_url(
    $pdk::base_url,
    $pdk::dist,
    $pdk::version,
    $pdk::staging_dir,
  )

  file { "${pdk::staging_dir}/pdk-installer":
    source => $url,
  }

}
