# -*- mode: ruby -*-
# vi: set ft=ruby :

#############
# VARIABLES #
#############

BOX_IMAGE="generic/rocky9"
# HOSTONLY_NAME="VirtualBox Host-Only Ethernet Adapter"

Vagrant.configure("2") do |config|

  config.vm.box = BOX_IMAGE
  config.vm.synced_folder ".", "/vagrant", disabled: false
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
     vb.gui = false
     vb.cpus = 2
   end
   config.vm.provision "shell", inline: <<-SHELL
      echo "Global shell provisioning hook executing"
   SHELL

    managed = [
    { name: "managed-node-01", ip: "192.168.56.11", memory: 1024, cpus: 1 }
    ]
  managed.each do |srv|
    config.vm.define srv[:name] do |node|
      node.vm.hostname = srv[:name]
      node.vm.network "private_network", ip: srv[:ip]
      node.vm.provider "virtualbox" do |vb|
                vb.name=srv[:name]
                vb.memory = srv[:memory]
                vb.cpus = srv[:cpus]
      end
      node.vm.provision "shell", inline: <<-SHELL
              echo "Managed node shell provisioning hook executed"
      SHELL
    end
  end

   config.vm.define "ansible-controller" do |controller|
      controller.vm.hostname = "ansible-controller"
      controller.vm.network "private_network", ip: "192.168.56.10"
      controller.vm.provider "virtualbox" do |vb|
                vb.name="ansible-controller"
                vb.memory = 2048
      end
      controller.vm.provision "shell", inline: <<-SHELL
              echo "Ansible Controller shell provisioning hook executed"
      SHELL
    end

end
