Vagrant.configure('2') do |config|
  config.vm.box = 'debian/buster64'
  config.vm.hostname = 'docker.local'
  config.vm.provider 'virtualbox' do |vb|
    vb.name = 'ubuntu-docker'
    vb.memory = '2048'
    vb.cpus = '2'
  end
  # set sync folder between vm and localhost (must exist)
  config.vm.synced_folder "data", "/data"

  # set static IP address VM (needed to communicate with docker)
  config.vm.network 'private_network', ip: '<REPLACE ME>'
  config.vm.network 'forwarded_port', guest: 2375, host: 2375, id: 'dockerd'
  config.vm.provision 'ansible', playbook: 'play.yml'
end 
