# Class: eclipse::set::helpers
#
# This class installs some helper plugins for Eclipse
#
# Sample Usage:
#
#  include eclipse::set::helpers
#
class eclipse::set::helpers {

  include eclipse
  include eclipse::params

  include eclipse::plugin::logviewer
  include eclipse::plugin::vrapper
  include eclipse::plugin::colortheme
  include eclipse::plugin::copyright_wizard
  include eclipse::plugin::ansi_console
  include eclipse::plugin::mechanic

}
