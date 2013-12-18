# Class: eclipse::plugin::pdt::twig
#
# This class installs the twig plugin from pdt-extensions
#
# Sample Usage:
#
#  include eclipse::plugin::pdt::twig
#
class eclipse::plugin::pdt::twig (
  $method = 'package',
  $ensure = present
) {

  include eclipse
  include eclipse::params
  include eclipse::plugin::pdt

  eclipse::plugin { 'twig':
    iu         => 'com.dubture.twig.feature.feature.group',
    method     => $method,
    repository => $eclipse::plugin::pdt::repository,
    require    => Eclipse::Plugin['pdt-extensions']
  }

}
