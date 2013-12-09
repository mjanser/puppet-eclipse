# Type: eclipse::plugin
#
# This type installs a Eclipse plugin
#
# Sample Usage:
#
#  eclipse::plugin { 'egit': }
#
define eclipse::plugin (
  $method  = 'package',
  $ensure  = present
) {

  include eclipse
  include eclipse::params

  if $method == 'package' and $eclipse::method != 'package' {
    fail('Eclipse plugins cannot be installed as package if Eclipse itself is not')
  }

  case $method {
    package: {
      package { "${eclipse::params::package_prefix}${title}":
        ensure => $ensure
      }
    }
    default: { fail("Installation method ${method} is not supported") }
  }

}
