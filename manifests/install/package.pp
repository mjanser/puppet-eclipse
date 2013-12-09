# Class: eclipse::install::package
#
# This module installs Eclipse using packages
#
# Sample Usage:
#
#  include eclipse::install::package
#
class eclipse::install::package (
  $ensure = present
) {

  include eclipse::params

  package { $eclipse::params::package:
    ensure => $ensure
  }

}
