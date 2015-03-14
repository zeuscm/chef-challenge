#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright 2015, CHEF-CHALLENGE LLC
#
# All rights reserved - Do Not Redistribute

package 'httpd' do
  action :install
end

service 'httpd' do
  action [:start, :enable]
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
end

#
