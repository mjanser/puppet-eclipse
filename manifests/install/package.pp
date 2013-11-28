# Class: eclipse::install::package
#
# This module installs Eclipse using packages
#
# Sample Usage:
#
#  include eclipse::install::package
#
class eclipse::install::package {

  include eclipse
  include eclipse::params

  package { $eclipse::params::package:
    ensure => $eclipse::ensure
  }

}
