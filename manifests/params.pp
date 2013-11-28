# Class: eclipse::params
#
# This class defines some parameters
#
class eclipse::params {

  $package = $::osfamily ? {
    default => 'eclipse-platform'
  }

  $target_dir = '/opt/eclipse'

}
