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
      should contain_eclipse__plugin__install__package('egit')
    }
  end

  describe 'Install plugin via p2 director' do
    let :title do
      'egit'
    end
    let :params do
      {
        :method => 'p2_director',
        :ensure => 'present'
      }
    end
    it {
      should include_class('eclipse')
      should contain_eclipse__plugin__install__p2_director('egit')
    }
  end
end