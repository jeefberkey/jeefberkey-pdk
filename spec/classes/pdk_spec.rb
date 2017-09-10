require 'spec_helper'

describe 'pdk' do
  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      let(:os_id) { "#{os_facts[:os]['family']}-#{os_facts[:os]['release']['major']}" }

      it { is_expected.to compile }
      it { is_expected.to contain_class('pdk') }
      it { is_expected.to contain_class('pdk::download') }
      it { is_expected.to contain_class('pdk::install') }

      context 'pdk::download' do
        base_url = 'https://pm.puppetlabs.com/cgi-bin/pdk_download.cgi'
        urls = {
          'Suse-11'      => "#{base_url}?dist=sles&rel=11&arch=x86_64&ver=latest",
          'Suse-12'      => "#{base_url}?dist=sles&rel=12&arch=x86_64&ver=latest",
          'RedHat-6'     => "#{base_url}?dist=el&rel=6&arch=x86_64&ver=latest",
          'RedHat-7'     => "#{base_url}?dist=el&rel=7&arch=x86_64&ver=latest",
          'Debian-14.04' => "#{base_url}?dist=ubuntu&rel=14.04&arch=amd64&ver=latest",
          'Debian-16.04' => "#{base_url}?dist=ubuntu&rel=16.04&arch=amd64&ver=latest",
          'windows-10'   => "#{base_url}?dist=win&arch=x64&ver=latest",
          'windows-7'    => "#{base_url}?dist=win&arch=x64&ver=latest",
          'windows-8'    => "#{base_url}?dist=win&arch=x64&ver=latest",
        }

        case os_facts[:kernel]
        when %r{Linux|Darwin}
          it { is_expected.to contain_remote_file('/tmp/pdk-installer') }
          it { is_expected.to contain_remote_file('/tmp/pdk-installer').with_source(urls[os_id]) }
        when %r{windows}
          it { is_expected.to contain_remote_file('C://pdk-installer') }
          it { is_expected.to contain_remote_file('C://pdk-installer').with_source(urls[os_id]) }
        end
      end

      context 'pdk::install' do
        case os_facts[:kernel]
        when %r{Linux|Darwin}
          it {
            is_expected.to create_package('pdk').with(
              ensure: 'present',
              source: '/tmp/pdk-installer',
            )
          }
        when %r{windows}
          it {
            is_expected.to create_package('pdk').with(
              ensure: 'present',
              source: 'C://pdk-installer',
            )
          }
        end
      end
    end
  end
end
