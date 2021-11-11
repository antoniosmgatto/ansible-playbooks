# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian/bullseye64"
  config.ssh.insert_key = false
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provider :virtualbox do |v|
    v.memory = 1024
    v.linked_clone = true
  end

  config.vm.define "app" do |app|
    app.vm.hostname = "app.test"
    app.vm.network :private_network, ip: "192.168.60.4"
  end

  # config.vm.network :forwarded_port, guest: 80, host: 4567
end
