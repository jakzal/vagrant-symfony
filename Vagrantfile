VAGRANTFILE_API_VERSION = "2"

vm_ip = "10.10.20.2"

Vagrant.require_plugin "vagrant-librarian-chef"
Vagrant.require_plugin "vagrant-omnibus"
Vagrant.require_plugin "vagrant-hostsupdater"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.provider "virtualbox" do |v|
    v.name = "symfony.dev"
    v.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.network :private_network, ip: vm_ip
  config.vm.hostname = "symfony.dev"
  config.hostsupdater.aliases = ["sf.dev"]

  require 'ffi'
  config.vm.synced_folder "./", "/home/vagrant/symfony.dev", :nfs => (FFI::Platform::IS_WINDOWS ? false: true)

  config.librarian_chef.cheffile_dir = "./tools/chef"

  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["./tools/chef/cookbooks", "./tools/chef/site-cookbooks"]
    chef.roles_path = "./tools/chef/roles"

    chef.add_role "development"
    chef.add_role "webserver"
    chef.add_role "symfony"
  end
end
