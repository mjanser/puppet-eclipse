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
  $package_bin = $::osfamily ? {
    default => '/usr/bin/eclipse'
  }

  $target_dir = '/opt'
  $download_bin = "${target_dir}/eclipse/eclipse"

}
