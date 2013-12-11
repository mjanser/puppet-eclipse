require 'spec_helper'

describe 'eclipse::install::download', :type => 'class' do
  describe "Install Eclipse" do
    let :facts do
      {
        :architecture => 'x86_64'
      }
    end
    let :params do
      {
        :ensure => 'present',
        :package => 'standard',
        :release_name => 'kepler',
        :service_release => 'SR1',
        :mirror => 'http://example.com'
      }
    end
    it {
      should contain_archive('eclipse').with({
        'ensure' => 'present',
        'url'    => "http://example.com/eclipse/technology/epp/downloads/release/kepler/SR1/eclipse-standard-kepler-SR1-linux-gtk-x86_64.tar.gz"
      })
      should contain_file('/usr/share/applications/opt-eclipse.desktop').with({
        'ensure' => 'present'
      })
    }
  end

  describe "Uninstall Eclipse" do
    let :params do
      {
        :ensure => 'absent'
      }
    end
    it {
      should contain_archive('eclipse').with({
        'ensure' => 'absent'
      })
      should contain_file('/usr/share/applications/opt-eclipse.desktop').with({
        'ensure' => 'absent'
      })
    }
  end
end
