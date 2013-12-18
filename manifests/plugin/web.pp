# Class: eclipse::plugin::web
#
# This class installs Eclipse plugins for web development (web tools platform)
#
# Sample Usage:
#
#  include eclipse::plugin::web
#
class eclipse::plugin::web (
  $method = 'package',
  $ensure = present
) {

  include eclipse
  include eclipse::params

  if $method == 'package' {
    eclipse::plugin { 'wtp-sourceediting':
      method => $method,
      ensure => $ensure
    }
  } else {
    eclipse::plugin { 'wst':
      iu     => 'org.eclipse.wst.common_ui.feature.feature.group',
      method => $method,
      ensure => $ensure
    }
    eclipse::plugin { 'wst-web':
      iu      => 'org.eclipse.wst.jsdt.feature.feature.group',
      method  => $method,
      ensure  => $ensure,
      require => Eclipse::Plugin['wst']
    }

    eclipse::plugin { 'wst-javascript':
      iu      => 'org.eclipse.wst.jsdt.feature.feature.group',
      method  => $method,
      ensure  => $ensure,
      require => Eclipse::Plugin['wst-web']
    }

    eclipse::plugin { 'wst-xml':
      iu      => 'org.eclipse.wst.xml_ui.feature.feature.group',
      method  => $method,
      ensure  => $ensure,
      require => Eclipse::Plugin['wst']
    }

    eclipse::plugin { 'wst-xsl':
      iu      => 'org.eclipse.wst.xsl.feature.feature.group',
      method  => $method,
      ensure  => $ensure,
      require => Eclipse::Plugin['wst']
    }
  }

}
