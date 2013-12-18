# Class: eclipse::plugin::colortheme
#
# This class installs the Eclipse plugin colortheme
#
# Sample Usage:
#
#  include eclipse::plugin::colortheme
#
class eclipse::plugin::colortheme (
  $method = 'package',
  $ensure = present
) {

  include eclipse
  include eclipse::params

  $repository = 'http://eclipse-color-theme.github.io/update/'

  eclipse::plugin { 'color-theme':
    iu         => 'com.github.eclipsecolortheme.feature.feature.group',
    method     => $method,
    repository => $repository
  }

}
