# Type: eclipse::plugin::p2_director
#
# This type installs a Eclipse plugin via the p2 director of Eclipse
#
# Sample Usage:
#
#  eclipse::plugin::p2_director { 'org.eclipse.egit.feature.group': }
#
define eclipse::plugin::p2_director (
  $iu         = $title,
  $repository = 'http://download.eclipse.org/releases/kepler',
  $ensure     = present
) {

  include eclipse
  include eclipse::params

  $eclipse_cmd = "${eclipse::bin} -application org.eclipse.equinox.p2.director -noSplash"
  $check_cmd   = "${eclipse_cmd} -listInstalledRoots | grep '^${iu}[/$]'"

  if $ensure == present {
    exec { "eclipse-p2-director: install ${title}":
      command => "${eclipse_cmd} -repository '${repository}' -installIU '${iu}'",
      unless  => $check_cmd
    }
  } else {
    exec { "eclipse-p2-director: uninstall ${title}":
      command => "${eclipse_cmd} -uninstallIU '${iu}'",
      onlyif  => $check_cmd
    }
  }

}
