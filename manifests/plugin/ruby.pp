# Class: eclipse::plugin::ruby
#
# This class installs the Ruby tools for Eclipse
#
# Sample Usage:
#
#  include eclipse::plugin::ruby
#
class eclipse::plugin::ruby (
  $method = 'package',
  $ensure = present
) {

  include eclipse
  include eclipse::params

  eclipse::plugin { 'dltk-ruby':
    iu     => 'org.eclipse.dltk.ruby.feature.group',
    method => $method,
    ensure => $ensure
  }

}
