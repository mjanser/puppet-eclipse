# Class: eclipse::set::php
#
# This class installs some PHP plugins for Eclipse
#
# Sample Usage:
#
#  include eclipse::set::php
#
class eclipse::set::php {

  include eclipse
  include eclipse::params

  include eclipse::plugin::egit
  include eclipse::plugin::web
  include eclipse::plugin::mylyn
  include eclipse::plugin::pdt
  include eclipse::plugin::pdt::composer
  include eclipse::plugin::pdt::doctrine
  include eclipse::plugin::pdt::symfony
  include eclipse::plugin::pdt::twig
  include eclipse::plugin::pdt::tools
  include eclipse::plugin::pdt::makegood
  include eclipse::plugin::pdt::editors

}
