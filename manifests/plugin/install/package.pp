# Type: eclipse::plugin::install::package
#
# This type installs a Eclipse plugin via package
#
# Sample Usage:
#
#  eclipse::plugin::install::package { 'egit': }
#
define eclipse::plugin::install::package (
  $ensure = present
) {

  include eclipse
  include eclipse::params

  package { "${eclipse::params::package_prefix}${title}":
    ensure  => $ensure,
    require => Class['eclipse']
  }

}
