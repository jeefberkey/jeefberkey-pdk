# Calculate the PDK download url
function pdk::munge_pdk_url (
  Stdlib::HTTPSUrl $base_url,
  Pdk::Dist $dist,
  String $version,
  Stdlib::AbsolutePath $staging_dir = undef,
) {

  $param_map = {
    'dist' => $dist,
    'rel'  => $facts['os']['release']['major'],
    'arch' => $facts['os']['architecture'],
    'ver'  => $version,
  }

  $param_map.reduce([$base_url,'?']) |$memo,$value| {
    $memo + [ "${value[0]}=${value[1]}" ]
  }.join()


  # ?dist=el&rel=7&arch=x86_64&ver=latest
  # ?dist=el&rel=6&arch=x86_64&ver=latest
  # ?dist=sles&rel=12&arch=x86_64&ver=latest
  # ?dist=sles&rel=11&arch=x86_64&ver=latest
  # ?dist=ubuntu&rel=16.04&arch=amd64&ver=latest
  # ?dist=ubuntu&rel=14.04&arch=amd64&ver=latest
  # ?dist=win&arch=x64&ver=latest
  # ?dist=osx&rel=10.12&arch=x86_64&ver=latest
  # ?dist=osx&rel=10.11&arch=x86_64&ver=latest

}