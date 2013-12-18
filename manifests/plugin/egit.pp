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

  eclipse::plugin { 'egit':
    iu     => 'org.eclipse.egit.feature.group',
    method => $method,
    ensure => $ensure
  }

}
