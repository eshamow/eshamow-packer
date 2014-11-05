# == Class packer::params
#
# This class is meant to be called from packer
# It sets variables according to platform
#
class packer::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'packer'
      $service_name = 'packer'
    }
    'RedHat', 'Amazon': {
      $package_name = 'packer'
      $service_name = 'packer'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
