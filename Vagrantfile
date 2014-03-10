# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # define the user account and ssh key to authenticate with
  # NOTE: these can be replaced with environment variables to allow a
  # continuous integration server to also create and provision environments
  # config.ssh.username = 'deploy'
  # config.ssh.private_key_path = '~/.ssh/id_rsa'
  # config.ssh.forward_agent = true
  
  # disable snycing of the root project folder
  #config.vm.synced_folder '/vagrant', '.', :id => 'vagrant-root', :disabled => true
  
  config.vm.hostname = "gexample-berkshelf"
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.omnibus.chef_version = :latest
  config.vm.network :private_network, ip: "33.33.33.10"
  config.vm.boot_timeout = 120

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ['cookbooks', 'site-cookbooks']
    chef.data_bags_path = "data_bags"
    
    # Needed because sudo cookbook will remove vagrant from sudoers list
    chef.json = {
        "authorization" => {
            "sudo" => {
                "users" => [ "vagrant" ],
                "passwordless" => true,
            }
        }
      }
    chef.run_list = [
      "recipe[gexample::default]"
    ]
  end
    
end
