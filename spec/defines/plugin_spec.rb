require 'spec_helper'

describe 'eclipse::plugin', :type => :define do
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
        :method => 'package',
        :ensure => 'present'
      }
    end
    it {
      should include_class('eclipse')
      should contain_package('eclipse-egit')
    }
  end
end