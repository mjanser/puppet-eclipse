# Class: eclipse::plugin::egit
#
# This class installs the Eclipse plugin egit
#
# Sample Usage:
#
#  include eclipse::plugin::egit
#
class eclipse::plugin::egit (
  $method = 'package',
  $ensure = present
) {

  include eclipse
  include eclipse::params

  if $method == 'package' {
    eclipse::plugin::install::package { 'egit':
      ensure => $ensure
    }
  } else {
    eclipse::plugin::install::p2_director { 'org.eclipse.egit.feature.group':
      ensure => $ensure
    }
  }

}
