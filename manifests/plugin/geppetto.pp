# Class: eclipse::plugin::geppetto
#
# This class installs the Eclipse plugin geppetto
#
# Sample Usage:
#
#  include eclipse::plugin::geppetto
#
class eclipse::plugin::geppetto (
  $include_puppetdb = true,
  $method           = 'package',
  $ensure           = present
) {

  include eclipse
  include eclipse::params

  $repository = 'http://geppetto-updates.puppetlabs.com/4.x'

  eclipse::plugin { 'geppetto':
    iu         => 'com.puppetlabs.geppetto.feature.group',
    method     => $method,
    repository => $repository
  }

  if $include_puppetdb {
    eclipse::plugin { 'geppetto-puppetdb':
      iu         => 'com.puppetlabs.geppetto.puppetdb.feature.group',
      method     => $method,
      repository => $repository,
      require    => Eclipse::Plugin['geppetto']
    }
  }

}
