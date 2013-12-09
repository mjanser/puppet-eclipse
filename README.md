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
      method  => 'download',
      version => '4.3'
    }

Install a plugin using packages

    eclipse::plugin { 'egit':
      method => 'package'
    }
