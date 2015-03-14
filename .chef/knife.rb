# See https://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "zeuscm"
client_key               "/home/zeuscm/chef-repo/.chef/zeuscm.pem"
validation_client_name   "testchef00-validator"
validation_key           "/home/zeuscm/chef-repo/.chef/testchef00-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/testchef00"
syntax_check_cache_path  "#{ENV['HOME']}/.chef/syntaxcache"
cookbook_path            ["/home/zeuscm/chef-repo/cookbooks"]

knife[:rackspace_api_username] = "latam2012"
knife[:rackspace_api_key] = "2461417468320a3ce8514529605ac2a4"
knife[:rackspace_region] = :dfw

#https_proxy 'https://localhost:8888'
#knife[:ssl_verify_peer] = false
#require 'excon' 
#Excon.defaults[:read_timeout] = 1200

#Hosted Chef Server Access:
#Usuario: zeuscm
#password:  dr***standar 

