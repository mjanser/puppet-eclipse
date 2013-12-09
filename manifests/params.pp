# Class: eclipse::params
#
# This class defines some parameters
#
class eclipse::params {

  $package = $::osfamily ? {
    default => 'eclipse-platform'
  }
  $package_prefix = $::osfamily ? {
    default => 'eclipse-'
  }

  $target_dir = '/opt'

}
