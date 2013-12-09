require 'spec_helper'

describe 'eclipse', :type => 'class' do
  describe "Install using package method" do
    let :params do
      {
        :method => 'package'
      }
    end
    it {
      should contain_class('eclipse::install::package')
    }
  end

  describe "Install using download method" do
    let :params do
      {
        :method => 'download'
      }
    end
    it {
      should contain_class('eclipse::install::download')
    }
  end

  describe "Install using invalid method" do
    let :params do
      {
        :method => 'invalid'
      }
    end
    it {
      expect { should raise_error(Puppet::Error) }
    }
  end
end