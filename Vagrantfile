# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.define "centos" do |v|
    v.vm.box = "centos/7"

    v.vm.provision "shell", inline: <<-SHELL
      yum install http://yum.puppetlabs.com/puppet5/puppet-release-el-7.noarch.rpm
      yum install -y puppet-agent epel-release
      yum install -y vim git deltarpm htop ncdu tree wget jq
      wget 'https://pm.puppetlabs.com/cgi-bin/pdk_download.cgi?dist=el&rel=7&arch=x86_64&ver=latest' -O pdk.rpm -q
      yum install -y pdk.rpm
    SHELL
  end

  config.vm.define "windows" do |v|
    v.vm.box = "opentable/win-2012r2-standard-amd64-nocm"
    v.vm.provider "virtualbox" do |vb|
      vb.gui = true
    end
  end

  config.vm.define "windows-bare" do |v|
    v.vm.box = "opentable/win-2012r2-standard-amd64-nocm"
    v.vm.provider "virtualbox" do |vb|
      vb.gui = true
    end
  end


  # config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = "2"
  end

end
