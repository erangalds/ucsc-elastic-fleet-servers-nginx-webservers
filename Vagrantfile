# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Define the VMs
  vms = {
    "web1" => { :box => "generic/ubuntu2304", :ip => "192.168.1.12", :hostname => 'web1' },
    "web2" => { :box => "generic/ubuntu2304", :ip => "192.168.1.13", :hostname => 'web2' },
    "web3" => { :box => "generic/ubuntu2304", :ip => "192.168.1.14", :hostname => 'web3'  },
    "db" => { :box => "generic/ubuntu2304", :ip => "192.168.1.15", :hostname => 'db'  },
    "lb" => { :box => "generic/ubuntu2304", :ip => "192.168.1.16", :hostname => 'lb'  },
    "fleet" => { :box => "generic/ubuntu2304", :ip => "192.168.1.57", :hostname => 'fleet'  }
  }
   
  vms.each do |name, cfg|
    config.vm.define name do |config|
      config.vm.box = cfg[:box]
      config.vm.network "public_network", bridge: "my-lab-external", ip: cfg[:ip]
      config.vm.hostname = cfg[:hostname]

      config.vm.provision "shell", path: "scripts/change-ip-to-static.sh", args: ["desktop", cfg[:hostname]]
      config.vm.provider "hyperv" do |vb|
        vb.memory = "1024"
      end

      if name.start_with?("web")
        config.vm.provision "shell", inline: <<-SHELL
          sudo apt-get update
          sudo apt-get install -y nginx
        SHELL
      elsif name == "db"
        config.vm.provision "shell", inline: <<-SHELL
          sudo apt-get update
          sudo apt-get install -y postgresql postgresql-contrib
        SHELL
      elsif name == "lb"
        config.vm.provision "shell", inline: <<-SHELL
          sudo apt-get update
          sudo apt-get install -y nginx
        SHELL
      elsif name == "fleet"
        config.vm.provision "shell", inline: <<-SHELL
          sudo apt-get update
        SHELL
      end
    end
  end
end
