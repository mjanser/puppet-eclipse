# Class: eclipse
#
# This module installs Eclipse
#
# Sample Usage:
#
#  include eclipse
#
class eclipse (
  $package         = 'standard',
  $release_name    = 'kepler',
  $service_release = 'SR1',
  $method          = 'package',
  $ensure          = present
) {

  include eclipse::params

  case $method {
    download: {
      class { 'eclipse::install::download':
        package         => $package,
        release_name    => $release_name,
        service_release => $service_release,
        ensure          => $ensure
      }
    }
    package: {
      class { 'eclipse::install::package':
        ensure => $ensure
      }
    }
    default: {
      fail("Installation method ${method} is not supported")
    }
  }

}
