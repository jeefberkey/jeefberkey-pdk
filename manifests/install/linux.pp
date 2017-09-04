# pdk::install::linux
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include pdk::install::linux
class pdk::install::linux {

  $base_url = $pdk::base_url
  $dist     = $pdk::dist
  $arch     = $pdk::arch
  $version  = $pdk::version

  ?dist=el&rel=7&arch=x86_64&ver=latest
  ?dist=el&rel=6&arch=x86_64&ver=latest
  ?dist=sles&rel=12&arch=x86_64&ver=latest
  ?dist=sles&rel=11&arch=x86_64&ver=latest
  ?dist=ubuntu&rel=16.04&arch=amd64&ver=latest
  ?dist=ubuntu&rel=14.04&arch=amd64&ver=latest
}
