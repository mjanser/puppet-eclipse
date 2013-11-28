# Class: eclipse::install::download
#
# This module installs Eclipse using packages
#
# Sample Usage:
#
#  include eclipse::install::download
#
class eclipse::install::download {

  include eclipse
  include eclipse::params

  archive { 'eclipse':
    ensure => $eclipse::ensure,
    url    => 'http://test',
    target => $eclipse::params::target_dir
  }

}
