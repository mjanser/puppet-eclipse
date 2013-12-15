# Type: eclipse::plugin::package
#
# This type installs a Eclipse plugin via package
#
# Sample Usage:
#
#  eclipse::plugin::package { 'egit': }
#
define eclipse::plugin::package (
  $ensure = present
) {

  include eclipse
  include eclipse::params

  package { "${eclipse::params::package_prefix}${title}":
    ensure => $ensure
  }

}
