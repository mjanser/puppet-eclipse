# Class: eclipse::plugin::pdt::composer
#
# This class installs the composer plugin from pdt-extensions
#
# Sample Usage:
#
#  include eclipse::plugin::pdt::composer
#
class eclipse::plugin::pdt::composer (
  $method = 'package',
  $ensure = present
) {

  include eclipse
  include eclipse::params
  include eclipse::plugin::pdt

  eclipse::plugin { 'composer':
    iu         => 'com.dubture.composer.feature.feature.group',
    method     => $method,
    repository => "${eclipse::plugin::pdt::repository},${eclipse::repository}",
    require    => Eclipse::Plugin['pdt-extensions']
  }

}
