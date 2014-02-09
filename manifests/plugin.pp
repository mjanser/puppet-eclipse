# Type: eclipse::plugin
#
# This type installs a Eclipse plugin
#
# Sample Usage:
#
#  eclipse::plugin { 'egit': }
#
define eclipse::plugin (
  $method     = 'package',
  $iu         = $title,
  $repository = '',
  $ensure     = present
) {

  include eclipse
  include eclipse::params

  Class['eclipse'] -> Eclipse::Plugin <| |>
  Class['eclipse'] -> Eclipse::Plugin::Install::Package <| |>
  Class['eclipse'] -> Eclipse::Plugin::Install::P2_director <| |>

  if $method == 'package' and $eclipse::method != 'package' {
    fail('Eclipse plugins cannot be installed as package if Eclipse itself is not')
  }

  case $method {
    package: {
      eclipse::plugin::install::package { $title:
        ensure  => $ensure
      }
    }
    p2_director: {
      eclipse::plugin::install::p2_director { $title:
        iu         => $iu,
        repository => $repository,
        ensure     => $ensure
      }
    }
    default: { fail("Installation method ${method} is not supported") }
  }

}
