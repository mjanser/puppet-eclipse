require 'spec_helper'

describe 'eclipse::plugin::install::p2_director', :type => :define do
  let :facts do
    {
      :osfamily => 'redhat'
    }
  end

  describe 'Install plugin' do
    let :title do
      'org.eclipse.egit.feature.group'
    end
    let :params do
      {
        :ensure => 'present'
      }
    end
    it {
      should include_class('eclipse')
      should contain_exec('eclipse-p2-director: install org.eclipse.egit.feature.group').with({
        :command => "/usr/bin/eclipse -application org.eclipse.equinox.p2.director -noSplash -repository 'http://download.eclipse.org/releases/kepler' -installIU 'org.eclipse.egit.feature.group'",
        :unless  => "/usr/bin/eclipse -application org.eclipse.equinox.p2.director -noSplash -listInstalledRoots | egrep '^org.eclipse.egit.feature.group(/|$)'",
      })
    }
  end

  describe 'Uninstall plugin' do
    let :title do
      'org.eclipse.egit.feature.group'
    end
    let :params do
      {
        :ensure => 'absent'
      }
    end
    it {
      should include_class('eclipse')
      should contain_exec('eclipse-p2-director: uninstall org.eclipse.egit.feature.group').with({
        :command => "/usr/bin/eclipse -application org.eclipse.equinox.p2.director -noSplash -uninstallIU 'org.eclipse.egit.feature.group'",
        :onlyif  => "/usr/bin/eclipse -application org.eclipse.equinox.p2.director -noSplash -listInstalledRoots | egrep '^org.eclipse.egit.feature.group(/|$)'",
      })
    }
  end
end