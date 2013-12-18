# Class: eclipse::plugin::pdt::tools
#
# This class installs PHP tools plugins from pdt-extensions
#
# Sample Usage:
#
#  include eclipse::plugin::pdt::tools
#
class eclipse::plugin::pdt::tools (
  $include_codesniffer = true,
  $include_phpunit     = true,
  $include_phpcpd      = true,
  $include_phpmd       = true,
  $method              = 'package',
  $ensure              = present
) {

  include eclipse
  include eclipse::params
  include eclipse::plugin::pdt

  eclipse::plugin { 'pti-core':
    iu         => 'org.phpsrc.eclipse.pti.core.feature.group',
    method     => $method,
    repository => $eclipse::plugin::pdt::repository,
    require    => Eclipse::Plugin['pdt-extensions']
  }
  eclipse::plugin { 'pti-pear':
    iu         => 'org.phpsrc.eclipse.pti.library.pear.feature.group',
    method     => $method,
    repository => "${eclipse::plugin::pdt::repository},${eclipse::repository}",
    require    => Eclipse::Plugin['pti-core']
  }

  if $include_codesniffer {
    eclipse::plugin { 'pti-codesniffer':
      iu         => 'org.phpsrc.eclipse.pti.tools.codesniffer.feature.group',
      method     => $method,
      repository => "${eclipse::plugin::pdt::repository},${eclipse::repository}",
      require    => Eclipse::Plugin['pti-core']
    }
  }

  if $include_codesniffer {
    eclipse::plugin { 'pti-phpunit':
      iu         => 'org.phpsrc.eclipse.pti.tools.phpunit.feature.group',
      method     => $method,
      repository => "${eclipse::plugin::pdt::repository},${eclipse::repository}",
      require    => Eclipse::Plugin['pti-core']
    }
  }

  if $include_codesniffer {
    eclipse::plugin { 'pti-phpcpd':
      iu         => 'org.phpsrc.eclipse.pti.tools.phpcpd.feature.group',
      method     => $method,
      repository => "${eclipse::plugin::pdt::repository},${eclipse::repository}",
      require    => Eclipse::Plugin['pti-core']
    }
  }

  if $include_codesniffer {
    eclipse::plugin { 'pti-phpmd':
      iu         => 'org.phpsrc.eclipse.pti.tools.phpmd.feature.group',
      method     => $method,
      repository => "${eclipse::plugin::pdt::repository},${eclipse::repository}",
      require    => Eclipse::Plugin['pti-core']
    }
  }

}
