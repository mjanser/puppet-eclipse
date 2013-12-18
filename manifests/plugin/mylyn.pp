# Class: eclipse::plugin::mylyn
#
# This class installs Eclipse plugins for Mylyn
#
# Sample Usage:
#
#  include eclipse::plugin::mylyn
#
class eclipse::plugin::mylyn (
  $include_wikitext = true,
  $include_git      = true,
  $method           = 'package',
  $ensure           = present
) {

  include eclipse
  include eclipse::params

  $repository = 'http://download.eclipse.org/mylyn/releases/latest'

  eclipse::plugin { 'mylyn-commons':
    iu         => 'org.eclipse.mylyn.commons.feature.group',
    method     => $method,
    repository => $repository
  }
  eclipse::plugin { 'mylyn':
    iu         => 'org.eclipse.mylyn.tasks.ide.feature.group',
    method     => $method,
    repository => $repository,
    ensure     => $ensure,
    require    => Eclipse::Plugin['mylyn-commons']
  }

  eclipse::plugin { 'mylyn-context':
    iu         => 'org.eclipse.mylyn.context_feature.feature.group',
    method     => $method,
    repository => $repository,
    require    => Eclipse::Plugin['mylyn-commons']
  }

  eclipse::plugin { 'mylyn-ide':
    iu         => 'org.eclipse.mylyn.ide_feature.feature.group',
    method     => $method,
    repository => $repository,
    require    => Eclipse::Plugin['mylyn-commons']
  }

  eclipse::plugin { 'mylyn-tasks-web':
    iu         => 'org.eclipse.mylyn.commons.repositories.http.feature.group',
    method     => $method,
    repository => $repository,
    require    => Eclipse::Plugin['mylyn-commons']
  }

  eclipse::plugin { 'mylyn-versions':
    iu         => 'org.eclipse.mylyn.versions.feature.group',
    method     => $method,
    repository => $repository,
    require    => Eclipse::Plugin['mylyn-commons']
  }

  if $include_git {
    eclipse::plugin { 'mylyn-versions-git':
      iu         => 'org.eclipse.mylyn.git.feature.group',
      method     => $method,
      repository => $repository,
      ensure     => $ensure,
      require    => Eclipse::Plugin['mylyn-commons']
    }
  }

  if $include_wikitext {
    eclipse::plugin { 'mylyn-docs-wikitext':
      iu         => 'org.eclipse.mylyn.wikitext_feature.feature.group',
      method     => $method,
      repository => $repository,
      ensure     => $ensure,
      require    => Eclipse::Plugin['mylyn-commons']
    }
  }

}
