# Class: eclipse::plugin::mechanic
#
# This class installs the Eclipse plugin mechanic
#
# Sample Usage:
#
#  include eclipse::plugin::mechanic
#
class eclipse::plugin::mechanic (
  $method = 'package',
  $ensure = present
) {

  include eclipse
  include eclipse::params

  $repository = 'http://workspacemechanic.eclipselabs.org.codespot.com/git.update/mechanic'

  eclipse::plugin { 'mechanic':
    iu         => 'com.google.eclipse.mechanic.feature.group',
    method     => $method,
    repository => $repository
  }

}
