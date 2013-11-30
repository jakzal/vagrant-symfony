VAGRANTFILE_API_VERSION = "2"

vm_ip = "10.10.20.2"
vm_project_path = "/home/vagrant/symfony.dev"
project_domain = "symfony.dev"
project_aliases = ["sf.dev"]

Vagrant.require_plugin "vagrant-librarian-chef"
Vagrant.require_plugin "vagrant-omnibus"
Vagrant.require_plugin "vagrant-hostsupdater"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.provider "virtualbox" do |v|
    v.name = project_domain
    v.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.network :private_network, ip: vm_ip
  config.vm.hostname = project_domain
  config.hostsupdater.aliases = project_aliases

  require 'ffi'
  config.vm.synced_folder "./", vm_project_path, :nfs => (FFI::Platform::IS_WINDOWS ? false: true)

  config.librarian_chef.cheffile_dir = "./tools/chef"

  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["./tools/chef/cookbooks", "./tools/chef/site-cookbooks"]
    chef.roles_path = "./tools/chef/roles"

    chef.add_role "development"
    chef.add_role "webserver"
    chef.add_role "symfony"

    chef.json = {
      "symfony" => {
        "project_path" => vm_project_path,
        "domain" => project_domain,
        "aliases" => project_aliases,
        "default_front_controller" => "app_dev.php"
      }
    }
  end
end
