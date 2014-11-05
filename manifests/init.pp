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
  $package_name = $::packer::params::package_name,
  $service_name = $::packer::params::service_name,
) inherits ::packer::params {

  # validate parameters here

  class { '::packer::install': } ->
  class { '::packer::config': } ~>
  class { '::packer::service': } ->
  Class['::packer']
}
