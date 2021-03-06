#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright 2015, CHEF-CHALLENGE LLC
#
# All rights reserved - Do Not Redistribute

#include_recipe 'firewalld'
#include_recipe 'ufw'
#include_recipe 'iptables'

case node["platform_family"]
when "debian"
   apache_package="apache2"
   pkg_firewall="ufw"

   include_recipe 'ufw'
   package 'ufw' do
        action :install
   end

   firewall_rule 'http' do
     action :allow
   end

when "rhel"
   apache_package="httpd"
   if node['platform_family']=='rhel' and node['platform_version'] =~ /^7/
     include_recipe 'firewalld'
     pkg_firewall="firewalld"
   else
     include_recipe 'iptables'
     pkg_firewall="iptables"
   end

   package pkg_firewall do
     action :install
   end

   service pkg_firewall do
     action [:start, :enable]
   end

   if node['platform_family']=='rhel' and node['platform_version'] =~ /^7/
     firewalld_service 'http'
   else
     iptables_rule "http"
     iptables_rule "ssh"
   end

end

package apache_package do
  action :install
end

service apache_package do
  action [:start, :enable]
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
end


