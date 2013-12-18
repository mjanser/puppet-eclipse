# Class: eclipse::plugin::logviewer
#
# This class installs the Eclipse plugin logviewer
#
# Sample Usage:
#
#  include eclipse::plugin::logviewer
#
class eclipse::plugin::logviewer (
  $method = 'package',
  $ensure = present
) {

  include eclipse
  include eclipse::params
  include eclipse::plugin::pdt

  eclipse::plugin { 'logviewer':
    iu         => 'de.anbos.eclipse.logviewer.feature.feature.group',
    method     => $method,
    repository => $eclipse::plugin::pdt::repository,
    require    => Eclipse::Plugin['pdt-extensions']
  }

}
