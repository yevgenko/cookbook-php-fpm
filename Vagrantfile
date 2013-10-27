# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  # config.vm.box = "precise32"
  # config.vm.box = "Debian squeeze 32"
  # config.vm.box_url = "http://mathie-vagrant-boxes.s3.amazonaws.com/debian_squeeze_32.box"
  config.vm.box = "Ubuntu precise 64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  # config.vm.box = "Ubuntu 13.10 i386"
  # config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/saucy/current/saucy-server-cloudimg-i386-vagrant-disk1.box"
  # config.vm.box = "lucid32"
  # config.vm.box_url = "http://files.vagrantup.com/lucid32.box"

  # config.vm.box = "Debian Squeeze 6.0.7 amd64"
  # config.vm.box_url = "http://public.sphax3d.org/vagrant/squeeze64.box"

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  config.vm.forward_port 80, 8080

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ".sandbox/cookbooks"
    chef.roles_path = ".sandbox/roles"
    chef.data_bags_path = ".sandbox/data_bags"
    chef.add_recipe "apt"
    # chef.add_recipe "yum"
    chef.add_recipe "php-fpm"
    chef.add_recipe "nginx"
  end

end
