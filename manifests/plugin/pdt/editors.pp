# Class: eclipse::plugin::pdt::editors
#
# This class installs editors from pdt-extensions
#
# Sample Usage:
#
#  include eclipse::plugin::pdt::editors
#
class eclipse::plugin::pdt::editors (
  $include_markdown = true,
  $include_rest     = true,
  $include_yedit    = true,
  $include_jsonedit = true,
  $method           = 'package',
  $ensure           = present
) {

  include eclipse
  include eclipse::params
  include eclipse::plugin::pdt

  if $include_markdown {
    eclipse::plugin { 'markdown':
      iu         => 'markdown.editor.feature.feature.group',
      method     => $method,
      repository => $eclipse::plugin::pdt::repository,
      require    => Eclipse::Plugin['pdt-extensions']
    }
  }

  if $include_rest {
    eclipse::plugin { 'rest':
      iu         => 'org.psem2m.eclipse.rest.editor.feature.group',
      method     => $method,
      repository => $eclipse::plugin::pdt::repository,
      require    => Eclipse::Plugin['pdt-extensions']
    }
  }

  if $include_yedit {
    eclipse::plugin { 'yedit':
      iu         => 'org.dadacoalition.yedit.feature.feature.group',
      method     => $method,
      repository => $eclipse::plugin::pdt::repository,
      require    => Eclipse::Plugin['pdt-extensions']
    }
  }

  if $include_jsonedit {
    eclipse::plugin { 'jsonedit':
      iu         => 'org.sourceforge.jsonedit.feature.feature.group',
      method     => $method,
      repository => $eclipse::plugin::pdt::repository,
      require    => Eclipse::Plugin['pdt-extensions']
    }
  }

}
