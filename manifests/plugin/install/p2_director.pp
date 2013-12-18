# Type: eclipse::plugin::install::p2_director
#
# This type installs a Eclipse plugin via the p2 director of Eclipse
#
# Sample Usage:
#
#  eclipse::plugin::install::p2_director { 'org.eclipse.egit.feature.group': }
#
define eclipse::plugin::install::p2_director (
  $iu         = $title,
  $repository = '',
  $ensure     = present
) {

  include eclipse
  include eclipse::params

  $repository_url = $repository ? {
    ''      => $eclipse::repository,
    default => $repository
  }

  $eclipse_cmd = "${eclipse::bin} -application org.eclipse.equinox.p2.director -noSplash"
  $check_cmd   = "${eclipse_cmd} -listInstalledRoots | egrep '^${iu}(/|$)'"

  if $ensure == present {
    exec { "eclipse-p2-director: install ${title}":
      command => "${eclipse_cmd} -repository '${repository_url}' -installIU '${iu}'",
      unless  => $check_cmd,
      require => Class['eclipse']
    }
  } else {
    exec { "eclipse-p2-director: uninstall ${title}":
      command => "${eclipse_cmd} -uninstallIU '${iu}'",
      onlyif  => $check_cmd,
      require => Class['eclipse']
    }
  }

}
