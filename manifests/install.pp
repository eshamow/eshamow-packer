# == Class packer::install
#
class packer::install {

  package { $::packer::package_name:
    ensure => present,
  }
}
