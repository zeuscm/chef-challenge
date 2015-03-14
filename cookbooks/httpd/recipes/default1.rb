#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright 2015, CHEF-CHALLENGE LLC
#
# All rights reserved - Do Not Redistribute

if node.attribute?('platform_family')=='debian'
   apache_package="apache2"
   pkg_firewall="ufw"
   
   package ufw do
        action :install
   end
   
else
   apache_package="httpd"
   if node.attribute?('platform_family')=='rhel' and node.attribute?('platform_version')=~ /^7/
     pkg_firewall="firewalld"
   else
     pkg_firewall="iptables"
   end

   package pkg_firewall do
     action :install
   end

   service pkg_firewall do
     action [:start, :enable]
   end
   
   if node.attribute?('platform_family')=='rhel' and node.attribute?('platform_version')=~ /^7/
     firewalld_service 'http'
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


