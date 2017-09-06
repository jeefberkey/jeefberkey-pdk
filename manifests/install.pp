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
  case $facts['kernel'] {
    'linux':   { include '::pdk::install::linux'   }
    'Darwin':  { include '::pdk::install::macos'   }
    'windows': { include '::pdk::install::windows' }
    default:   { fail("${facts['kernel']} not supported") }
  }
}
