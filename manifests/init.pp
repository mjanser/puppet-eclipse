# Class: eclipse
#
# This module installs Eclipse
#
# Sample Usage:
#
#  include eclipse
#
class eclipse (
  $version = '4.3',
  $method  = 'package',
  $ensure  = present
) {

  include eclipse::params

  case $method {
    download: { include eclipse::install::download }
    package: { include eclipse::install::package }
    default: { fail("Installation method ${method} is not supported") }
  }

}
