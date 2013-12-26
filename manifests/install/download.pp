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
  $owner_group     = undef,
  $ensure          = present
) {

  include eclipse::params

  $filename = "eclipse-${package}-${release_name}-${service_release}-linux-gtk-${::architecture}.tar.gz"
  $url = "${mirror}/eclipse/technology/epp/downloads/release/${release_name}/${service_release}/${filename}"

  if $owner_group and $ensure == 'present' {
    file { "${eclipse::params::target_dir}/eclipse":
      ensure => directory,
      group  => $owner_group,
      mode   => 'u=rwx,g=rwxs,o=rx'
    }
    File["${eclipse::params::target_dir}/eclipse"] -> Archive['eclipse']
  }

  archive { 'eclipse':
    ensure => $ensure,
    url    => $url,
    target => $eclipse::params::target_dir
  }

  file { '/usr/share/applications/opt-eclipse.desktop':
    ensure  => $ensure,
    content => template('eclipse/opt-eclipse.desktop.erb'),
    require => Archive['eclipse']
  }

}
