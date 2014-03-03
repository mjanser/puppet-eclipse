# Class: eclipse::plugin::shelled
#
# This class installs the Eclipse plugin shelled
#
# Sample Usage:
#
#  include eclipse::plugin::shelled
#
class eclipse::plugin::shelled (
  $method = 'package',
  $ensure = present
) {

  include eclipse
  include eclipse::params

  $repository = 'http://sourceforge.net/projects/shelled/files/shelled/update/'

  eclipse::plugin { 'shelled':
    iu         => 'net.sourceforge.shelled.feature.group',
    method     => $method,
    repository => "${repository},${eclipse::repository}"
  }

}
