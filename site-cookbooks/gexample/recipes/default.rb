#
# Cookbook Name:: gexample
# Recipe:: default
#
# Copyright 2014, Jeff Owens
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'
include_recipe 'build-essential'
include_recipe 'openssh'
include_recipe 'git'
include_recipe "chef-solo-search"
include_recipe "sudo"
include_recipe 'users::sysadmins'
include_recipe 'runit'

# provisions node.js and npm
include_recipe 'nodejs::install_from_source'
include_recipe 'nodejs::npm'
include_recipe 'nginx'

# provisions global npm packages
node.gexample.application.npm_packages.each_pair do |pkg, ver|
  npm_package pkg do
    version ver
  end
end

package "unzip" do
  action :install
end

package "lynx" do
  action :install
end

# NGINX!

# # # this enables our site, kinda like a2ensite
execute 'enable-site' do
  command "ln -sf /etc/nginx/sites-available/#{node[:server_name]} /etc/nginx/sites-enabled/#{node[:server_name]}"
  notifies :restart, 'service[nginx]'
end
# 
# # # Our configuration template. Take a look at templates/nginx.conf.erb to see what's going on. 
template "/etc/nginx/sites-available/#{node[:server_name]}" do
  source 'nginx.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :run, "execute[enable-site]", :immediately
  variables(
     server_name: node.server_name
   )
end
# 
# # now add the service and we're done. 
service 'nginx'

execute  "apt-get update; apt-get upgrade; apt-get clean"



