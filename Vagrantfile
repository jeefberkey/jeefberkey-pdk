# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"

  # config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = "2"
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo yum install http://yum.puppetlabs.com/puppet5/puppet-release-el-7.noarch.rpm
    sudo yum install -y puppet-agent epel-release
    sudo yum install -y vim git deltarpm htop ncdu tree wget jq
    wget 'https://pm.puppetlabs.com/cgi-bin/pdk_download.cgi?dist=el&rel=7&arch=x86_64&ver=latest' -O pdk.rpm -q
    sudo yum install -y pdk.rpm
  SHELL
end
