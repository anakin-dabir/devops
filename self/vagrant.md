### ** Commands **
- vagrant init <box-name> (initiating vm)
- vagrant box add <box> (adding vagrant box (vm os installation))
- vagrant status (status of that virtual machine)
- vagrant global-status (status of all virtual machines)
- vagrant global-status --prune (filtering the virtual machines of vagrant vbox only)
- vagrant box list (to check list of boxes)
- vagrant provision (works on running vm) (Any provisioning configurations (e.g., shell scripts, Ansible, Puppet, Chef) defined in the Vagrantfile are run.)
- vargrant reload --provision (restart vm and force provisioning)
- vagrant plugin list (list of vagrant installed plugins)


### ** Create a folder **
- vagrant init <box-name> 
- vagrant up (start the virtualmachine)
- vagrant status (status of vm)
- vagrant ssh (connecting to vm)
- vagrant halt (vm shutdown)
- vagrant reload (vm restart)
- vagrant destroy (deleting vm)


## ** Vagrantfile **

Vagrant.configure("2") do |config|
  
  ## box/os 
  - config.vm.box = "ubuntu/bionic64" # Example: Ubuntu 18.04 (base box)
  - config.vm.box_version = "20220120.0.0" (box version)
  - config.vm.box_url = "https://example.com/custom.box" (custom box url)
  
  ## memory & storage
  - config.vm.provider "virtualbox" do |vb| (- hyperv: config.vm.provider "hyperv" do |hv|)
        vb.memory = "1024" # Set memory to 1024 MB
        vb.cpus = 2        # Allocate 2 CPUs
    end

  ## port forwarding
  - config.vm.network "forwarded_port", guest: 80, host: 8080
        If you have a web server running on port 80 inside the VM:
            - Access it on your host machine by navigating to http://localhost:8080 (host:port).
            - The traffic is forwarded to port 80 inside the VM (guest:port).
  
  ## private network
  - config.vm.network "private_network", type: "dhcp" (automatically assign ip)
  - config.vm.network "private_network", ip: "192.168.33.10"
        - Creates a private network where the VM is only accessible from the host machine or other VMs on the same network.
        - In a private network, the IP address is typically from a reserved private IP address range, such as:
            10.0.0.0 - 10.255.255.255
            172.16.0.0 - 172.31.255.255
            192.168.0.0 - 192.168.255.255
            - You can assign any IP address within these ranges, such as:
                config.vm.network "private_network", ip: "192.168.56.10"
            - Important: The IP must not conflict with another device on your host machine's network, especially if you're using bridged adapters.
  
  ## public network
  - config.vm.network "public_network" (bridge the VM to host's network)
        - Creates a public network where the VM is directly connected to the same network as the host machine.
  
  ## multiple vms
  - config.vm.define "vm1" do |vm1|
        vm1.vm.box = "ubuntu/bionic64"
        vm1.vm.network "private_network", ip: "192.168.33.10"
    end
    config.vm.define "vm2" do |vm2|
        vm2.vm.box = "ubuntu/bionic64"
        vm2.vm.network "private_network", ip: "192.168.33.11"
    end
    
   ## Change the default SSH username
   - config.ssh.username = "newuser"  
   
   ## Provisioning (Provisioning automates the setup of the VM after it boots)
   - config.vm.provision "shell", path: "script.sh" (file path given)
   - config.vm.provision "shell", inline: <<-SHELL
        echo "Hello, Vagrant!"
        apt-get update
        apt-get install -y nginx
    SHELL
    
   ## folder sync
   - config.vm.synced_folder "./data", "/data"
        - It specifies a synced folder between your host machine (your computer) and the guest machine (the virtual machine created by Vagrant).
        - "./data": This is the path to the folder on your host machine (relative to the location of the Vagrantfile).
        - "/data": This is the path where the folder will be accessible inside the VM.
   
   ## Environment variables
   - config.vm.synced_folder ENV['HOST_FOLDER'] || "./data", "/data"
   - export HOST_FOLDER=/path/to/host/folder 
        The export command sets a variable in the current shell session. If you want it to persist across sessions, you need to add it to your shell configuration file (like .bashrc, .zshrc, or .bash_profile)
   - vagrant up     
   
   ## vagrant-hostmanager plugin
   config.hostmanager.enabled = true 
   config.hostmanager.manage_host = true
        - The Vagrant Hostmanager plugin is used to automatically update the hosts file (/etc/hosts on Linux/macOS or C:\Windows\System32\drivers\etc\hosts on Windows) on both the host machine and guest VMs.
        - It allows you to access Vagrant VMs using friendly hostnames (e.g., myproject.local) instead of IP addresses.
        - If you have multiple Vagrant machines in a cluster (e.g., web, database, cache servers), Hostmanager ensures each VM knows the others' hostnames and IPs.
  

end