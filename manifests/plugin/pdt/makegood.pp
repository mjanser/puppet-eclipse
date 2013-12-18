# Class: eclipse::plugin::pdt::makegood
#
# This class installs the makegood plugin from pdt-extensions
#
# Sample Usage:
#
#  include eclipse::plugin::pdt::makegood
#
class eclipse::plugin::pdt::makegood (
  $method = 'package',
  $ensure = present
) {

  include eclipse
  include eclipse::params
  include eclipse::plugin::pdt

  eclipse::plugin { 'makegood':
    iu         => 'com.piece_framework.makegood_feature.feature.group',
    method     => $method,
    repository => "${eclipse::plugin::pdt::repository},${eclipse::repository}",
    require    => Eclipse::Plugin['pdt-extensions']
  }

}
