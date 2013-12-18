# Class: eclipse::plugin::pdt::doctrine
#
# This class installs the doctrine plugin from pdt-extensions
#
# Sample Usage:
#
#  include eclipse::plugin::pdt::doctrine
#
class eclipse::plugin::pdt::doctrine (
  $method = 'package',
  $ensure = present
) {

  include eclipse
  include eclipse::params
  include eclipse::plugin::pdt

  eclipse::plugin { 'doctrine':
    iu         => 'com.dubture.doctrine.feature.feature.group',
    method     => $method,
    repository => "${eclipse::plugin::pdt::repository},${eclipse::repository}",
    require    => Eclipse::Plugin['pdt-extensions']
  }

}
