# Eclipse module for Puppet #

This module installs Eclipse.

## Description

This module can install Eclipse in different ways.

Currently supports:

* Linux

## Usage

Install with default options

    include eclipse

Install Eclipse using packages

    class { 'eclipse':
      method => 'package'
    }

Install Eclipse with downloading it

    class { 'eclipse':
      method => 'download'
    }

Install a specific version (only for download method)

    class { 'eclipse':
      method          => 'download',
      release_name    => 'kepler',
      service_release => 'SR1'
    }

Install a plugin using packages

    eclipse::plugin { 'egit':
      method => 'package'
    }

Install a plugin using *p2_director*

    eclipse::plugin { 'egit':
      method => 'p2_director',
      iu     => 'org.eclipse.egit.feature.group'
    }

Install a third-party plugin using *p2_director*

    eclipse::plugin { 'pdt':
      method     => 'p2_director',
      iu         => 'org.eclipse.php.feature.group',
      repository => 'http://p2-dev.pdt-extensions.org/'
    }

## Available plugins

- eclipse::plugin::ansi_console
- eclipse::plugin::atlassian
- eclipse::plugin::colortheme
- eclipse::plugin::copyright_wizard
- eclipse::plugin::egit
- eclipse::plugin::geppetto
- eclipse::plugin::logviewer
- eclipse::plugin::mechanic
- eclipse::plugin::mylyn
- eclipse::plugin::pdt
- eclipse::plugin::pdt::composer
- eclipse::plugin::pdt::doctrine
- eclipse::plugin::pdt::editors
- eclipse::plugin::pdt::makegood
- eclipse::plugin::pdt::symfony
- eclipse::plugin::pdt::tools
- eclipse::plugin::pdt::twig
- eclipse::plugin::ruby
- eclipse::plugin::shelled
- eclipse::plugin::vrapper
- eclipse::plugin::web
- eclipse::set::helpers
- eclipse::set::php
