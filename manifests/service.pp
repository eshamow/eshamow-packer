# == Class packer::service
#
# This class is meant to be called from packer
# It ensure the service is running
#
class packer::service {

  service { $::packer::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
