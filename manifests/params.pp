# == Class packer::params
#
# This class is meant to be called from packer
# It sets variables according to platform
#
class packer::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'packer'
      $platform     = $::architecture
    }
    'RedHat', 'Amazon': {
      $package_name = 'packer'
      case $::architecture {
        'i386':   { $platform = $::architecture }
        'x86_64': { $platform = 'amd64' }
        default:  { fail("${::architecture} not supported") }
      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
  $version       = '0.7.2'
  $installer_dir = '/opt/puppet_archive'
  $installer_uri = 'https://dl.bintray.com/mitchellh/packer/'
  $target_path   = '/opt/packer/bin'
  $checksum      = '2e0a7971d0df81996ae1db0fe04291fb39a706cc9e8a2a98e9fe735c7289379f'
  $checksum_type = 'sha256'
}
