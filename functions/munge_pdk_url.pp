# Calculate the PDK download url
#
# Example url fragments:
#   ?dist=el&rel=7&arch=x86_64&ver=latest
#   ?dist=el&rel=6&arch=x86_64&ver=latest
#   ?dist=sles&rel=12&arch=x86_64&ver=latest
#   ?dist=sles&rel=11&arch=x86_64&ver=latest
#   ?dist=ubuntu&rel=16.04&arch=amd64&ver=latest
#   ?dist=ubuntu&rel=14.04&arch=amd64&ver=latest
#   ?dist=win&arch=x64&ver=latest
#   ?dist=osx&rel=10.12&arch=x86_64&ver=latest
#   ?dist=osx&rel=10.11&arch=x86_64&ver=latest
#
function pdk::munge_pdk_url (
  Stdlib::HTTPSUrl $base_url,
  Pdk::Dist $dist,
  String $version,
  Optional[Stdlib::AbsolutePath] $staging_dir = undef,
) {

  if $dist == 'win' {
    $param_map = {
      'dist' => $dist,
      'arch' => $facts['architecture'],
      'ver'  => $version,
    }
  }
  else {
    $param_map = {
      'dist' => $dist,
      'rel'  => $facts['os']['release']['major'],
      'arch' => $facts['architecture'],
      'ver'  => $version,
    }
  }

  $params = $param_map.reduce([]) |$memo,$value| {
    $memo + [ "${value[0]}=${value[1]}" ]
  }

  "${base_url}?${params.join('&')}"
}
