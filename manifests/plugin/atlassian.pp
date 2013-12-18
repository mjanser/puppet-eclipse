# Class: eclipse::plugin::atlassian
#
# This class installs the Eclipse plugin atlassian
#
# Sample Usage:
#
#  include eclipse::plugin::atlassian
#
class eclipse::plugin::atlassian (
  $method = 'package',
  $ensure = present
) {

  include eclipse
  include eclipse::params
  include eclipse::plugin::mylyn

  $repository = 'http://update.atlassian.com/atlassian-eclipse-plugin/e3.6'

  eclipse::plugin { 'atlassian-connector-commons':
    iu         => 'com.atlassian.connector.commons.feature.group',
    method     => $method,
    repository => "${repository},${eclipse::repository},${eclipse::plugin::mylyn::repository}",
    require    => [ Eclipse::Plugin['mylyn'], Eclipse::Plugin['mylyn-docs-wikitext'] ]
  }
  eclipse::plugin { 'atlassian-connector-jira':
    iu         => 'com.atlassian.connector.eclipse.jira.feature.group',
    method     => $method,
    repository => "${repository},${eclipse::repository},${eclipse::plugin::mylyn::repository}",
    require    => [ Eclipse::Plugin['atlassian-connector-commons'], Eclipse::Plugin['mylyn-tasks-web'] ]
  }
  eclipse::plugin { 'atlassian-connector':
    iu         => 'com.atlassian.connector.eclipse.feature.group',
    method     => $method,
    repository => "${repository},${eclipse::repository},${eclipse::plugin::mylyn::repository}",
    require    => Eclipse::Plugin['atlassian-connector-jira']
  }

}
