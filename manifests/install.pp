# == Class packer::install
#
class packer::install {
  $dirtree = dirtree($::packer::target_path)
  ensure_resource('file', $dirtree, {'ensure' => 'directory'})
  ensure_resource('file', $::packer::installer_dir, {'ensure' => 'directory'})

  archive { "${::packer::installer_dir}/${::packer::installer_filename}":
    ensure        => present,
    source        => "${::packer::installer_uri}/${::packer::installer_filename}",
    checksum      => $::packer::checksum,
    checksum_type => $::packer::checksum_type,
    tls_verify    => false,
    extract       => true,
    extract_path  => $::packer::target_path,
    creates       => "${::packer::target_path}/packer",
    cleanup       => true,
  }
}
