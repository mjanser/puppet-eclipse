require 'spec_helper'

describe 'eclipse::plugin::package', :type => :define do
  let :facts do
    {
      :osfamily => 'redhat'
    }
  end

  describe 'Install plugin package' do
    let :title do
      'egit'
    end
    let :params do
      {
        :ensure => 'present'
      }
    end
    it {
      should contain_package('eclipse-egit')
    }
  end
end