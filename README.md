# Eclipse module for Puppet #

This module installs Eclipse.

## Description

This module can install Eclipse in different ways.

Currently supports:

* Linux

## Usage

Install default version

    include eclipse

Install a specific version

    class { 'eclipse':
      version => '4.3'
    }

Install Eclipse using packages

    class { 'eclipse':
      method => 'package'
    }

Install Eclipse with downloading it

    class { 'eclipse':
      method => 'download'
    }
