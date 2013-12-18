# Class: eclipse::plugin::copyright_wizard
#
# This class installs the Eclipse plugin copyright-wizard
#
# Sample Usage:
#
#  include eclipse::plugin::copyright_wizard
#
class eclipse::plugin::copyright_wizard (
  $method = 'package',
  $ensure = present
) {

  include eclipse
  include eclipse::params
  include eclipse::plugin::pdt

  eclipse::plugin { 'copyright-wizard':
    iu         => 'com.wdev91.eclipse.copyright.feature.feature.group',
    method     => $method,
    repository => $eclipse::plugin::pdt::repository,
    require    => Eclipse::Plugin['pdt-extensions']
  }

}
