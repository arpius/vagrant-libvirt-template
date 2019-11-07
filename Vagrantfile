# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

CONFIG = YAML.load_file('config.yml')

Vagrant.configure("2") do |config|
  config.vm.provider :libvirt do |libvirt|
    libvirt.qemu_use_session = true
    libvirt.uri = CONFIG['session_uri']
    libvirt.system_uri = CONFIG['system_uri']
    libvirt.storage_pool_path = CONFIG['storage_pool_path']
    libvirt.management_network_device = CONFIG['network_device']
    libvirt.cpus = CONFIG['cpus']
    libvirt.memory = CONFIG['memory']
  end

  config.vm.box = CONFIG['box']
  config.vm.hostname = CONFIG['hostname']
  config.vm.network :public_network,
    :dev => CONFIG['network_device'],
    :mode => CONFIG['network_mode'],
    :type => CONFIG['network_type'],
    :ip => CONFIG['ip']
  config.vm.synced_folder CONFIG['synced_folder'], '/vagrant', type: 'rsync'
  config.ssh.insert_key = false
  config.vm.provision "file", source: CONFIG['ssh_public_key'], destination: "~/.ssh/authorized_keys"
  config.vm.provision "shell", path: "config.sh"
end
