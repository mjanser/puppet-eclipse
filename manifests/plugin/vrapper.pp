# Class: eclipse::plugin::vrapper
#
# This class installs the Eclipse plugin vrapper
#
# Sample Usage:
#
#  include eclipse::plugin::vrapper
#
class eclipse::plugin::vrapper (
  $method = 'package',
  $ensure = present
) {

  include eclipse
  include eclipse::params
  include eclipse::plugin::pdt

  eclipse::plugin { 'vrapper':
    iu         => 'net.sourceforge.vrapper.feature.group',
    method     => $method,
    repository => $eclipse::plugin::pdt::repository,
    require    => Eclipse::Plugin['pdt-extensions']
  }

  if $method == 'p2_director' {
    eclipse::plugin { 'vrapper-surround':
      iu         => 'net.sourceforge.vrapper.plugin.surround.feature.group',
      method     => $method,
      repository => $eclipse::plugin::pdt::repository,
      require    => Eclipse::Plugin['vrapper']
    }
  }

}
