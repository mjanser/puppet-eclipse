# Class: eclipse::plugin::pdt::symfony
#
# This class installs the symfony plugin from pdt-extensions
#
# Sample Usage:
#
#  include eclipse::plugin::pdt::symfony
#
class eclipse::plugin::pdt::symfony (
  $method = 'package',
  $ensure = present
) {

  include eclipse
  include eclipse::params
  include eclipse::plugin::pdt::composer

  eclipse::plugin { 'symfony':
    iu         => 'com.dubture.symfony.feature.feature.group',
    method     => $method,
    repository => "${eclipse::plugin::pdt::repository},${eclipse::repository}",
    require    => Eclipse::Plugin['composer']
  }

}
