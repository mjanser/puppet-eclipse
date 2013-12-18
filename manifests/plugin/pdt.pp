# Class: eclipse::plugin::pdt
#
# This class installs Eclipse PDT from pdt-extensions
#
# Sample Usage:
#
#  include eclipse::plugin::pdt
#
class eclipse::plugin::pdt (
  $include_mylyn      = true,
  $include_extensions = true,
  $method             = 'package',
  $ensure             = present
) {

  include eclipse
  include eclipse::params

  $repository = 'http://p2-dev.pdt-extensions.org/'

  eclipse::plugin { 'pdt':
    iu         => 'org.eclipse.php.feature.group',
    method     => $method,
    repository => "${repository},${eclipse::repository}"
  }

  if $include_mylyn {
    eclipse::plugin { 'pdt-mylyn':
      iu         => 'org.eclipse.php.mylyn.feature.group',
      method     => $method,
      repository => $repository,
      require    => Eclipse::Plugin['pdt']
    }
  }

  if $include_extensions {
    eclipse::plugin { 'pdt-extensions':
      iu         => 'org.pdtextensions.feature.feature.group',
      method     => $method,
      repository => "${repository},${eclipse::repository}",
      require    => Eclipse::Plugin['pdt']
    }

    eclipse::plugin { 'indexing':
      iu         => 'com.dubture.indexing.feature.feature.group',
      method     => $method,
      repository => "${repository},${eclipse::repository}",
      require    => Eclipse::Plugin['pdt-extensions']
    }
  }

}
