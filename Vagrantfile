# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  require 'yaml'
  if File.exist?('./config.yml')
    # Load config.yml
    vconfig = YAML::load_file("./config.yml")
    # Set base box.
    config.vm.box = vconfig['vagrant_box']
  end

  # Check for plugins and install if not.
  %x(vagrant plugin install vagrant-hostsupdater) unless Vagrant.has_plugin?('vagrant-hostsupdater')
  %x(vagrant plugin install vagrant-bindfs) unless Vagrant.has_plugin?('vagrant-bindfs')

  # Upload vcl file.
  config.vm.provision "upload_vcl", type: "file" do |vcl|
    vcl.source = "vagrant-includes/default.vcl"
    vcl.destination = "/home/vagrant/default.vcl"
  end

  # Configure varnish.
  config.vm.provision "restart_varnish", type: "shell" do |s|
    s.privileged = true
    s.inline = "cp -f /home/vagrant/default.vcl /etc/varnish/default.vcl && service varnish restart"
  end

end
