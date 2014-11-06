# == Class: packer
#
# Full description of class packer here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class packer (
  $package_name       = $::packer::params::package_name,
  $version            = $::packer::params::version,
  $installer_dir      = $::packer::params::installer_dir,
  $installer_uri      = $::packer::params::installer_uri,
  $checksum           = $::packer::params::checksum,
  $checksum_type      = $::packer::params::checksum_type,
  $target_path        = $::packer::params::target_path,
  $installer_filename = "packer_${version}_linux_${::packer::params::platform}.zip",
) inherits ::packer::params {

  # validate parameters here

  class { '::packer::install': } ~>
  Class['::packer']
}
