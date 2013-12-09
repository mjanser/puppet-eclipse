# Class: eclipse::install::download
#
# This module installs Eclipse using packages
#
# Sample Usage:
#
#  include eclipse::install::download
#
class eclipse::install::download (
  $package         = 'standard',
  $release_name    = 'kepler',
  $service_release = 'SR1',
  $mirror          = 'http://mirror.switch.ch/ftp/mirror',
  $ensure          = present
) {

  include eclipse::params

  $filename = "eclipse-${package}-${release_name}-${service_release}-linux-gtk-${::architecture}.tar.gz"
  $url = "${mirror}/eclipse/technology/epp/downloads/release/${release_name}/${service_release}/${filename}"

  archive { 'eclipse':
    ensure => $ensure,
    url    => $url,
    target => $eclipse::params::target_dir
  }

}
