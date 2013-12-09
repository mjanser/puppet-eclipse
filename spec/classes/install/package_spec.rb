require 'spec_helper'

describe 'eclipse::install::package', :type => 'class' do
  context "On a RedHat OS" do
    let :facts do
      {
        :osfamily => 'redhat'
      }
    end
    describe "Install Eclipse" do
      let :params do
        {
          :ensure => 'present'
        }
      end
      it {
        should contain_package('eclipse-platform').with({
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
        should contain_package('eclipse-platform').with({
          'ensure' => 'absent'
        })
      }
    end
  end
end