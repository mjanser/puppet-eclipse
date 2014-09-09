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

  $archsuffix = $::architecture ? {
    /i.86/           => '',
    /(amd64|x86_64)/ => '-x86_64',
    default          => "-${::architecture}"
  }

  $filename = "eclipse-${package}-${release_name}-${service_release}-linux-gtk${archsuffix}"
  $url = "${mirror}/eclipse/technology/epp/downloads/release/${release_name}/${service_release}/${filename}.tar.gz"

  if $owner_group and $ensure == 'present' {
    exec { 'eclipse ownership':
      command     => "chgrp -R '${owner_group}' '${eclipse::params::target_dir}/eclipse'",
      refreshonly => true,
      subscribe   => Archive[$filename]
    }
    exec { 'eclipse group permissions':
      command     => "find '${eclipse::params::target_dir}/eclipse' -type d -exec chmod g+s {} \\;",
      refreshonly => true,
      subscribe   => Archive[$filename]
    }
    exec { 'eclipse write permissions':
      command     => "chmod -R g+w '${eclipse::params::target_dir}/eclipse'",
      refreshonly => true,
      subscribe   => Archive[$filename]
    }
  }

  archive { $filename:
    ensure   => $ensure,
    url      => $url,
    target   => $eclipse::params::target_dir,
    root_dir => 'eclipse',
    timeout  => 0,
  }

  file { '/usr/share/applications/opt-eclipse.desktop':
    ensure  => $ensure,
    content => template('eclipse/opt-eclipse.desktop.erb'),
    mode    => 644,
    require => Archive[$filename]
  }

}
