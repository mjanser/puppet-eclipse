# Class: eclipse::plugin::ansi_console
#
# This class installs the Eclipse plugin ansi-console
#
# Sample Usage:
#
#  include eclipse::plugin::ansi_console
#
class eclipse::plugin::ansi_console (
  $method = 'package',
  $ensure = present
) {

  include eclipse
  include eclipse::params
  include eclipse::plugin::pdt

  eclipse::plugin { 'ansi-console':
    iu         => 'net.mihai-nita.ansicon.feature.group',
    method     => $method,
    repository => $eclipse::plugin::pdt::repository,
    require    => Eclipse::Plugin['pdt-extensions']
  }

}
