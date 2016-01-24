require 'serverspec'
require 'winrm'
require 'infrataster/rspec'
require 'yaml'

set :backend, :winrm

properties = YAML.load_file('properties.yml')

host = ENV['TARGET_HOST']
set_property properties[host]

Infrataster::Server.define(properties[host][:name], host)

user = ENV['USERNAME']
pass = ENV['PASSWORD']
endpoint = "http://#{ENV['TARGET_HOST']}:5985/wsman"

winrm = ::WinRM::WinRMWebService.new(endpoint, :ssl, :user => user, :pass => pass, :basic_auth_only => true)
winrm.set_timeout 300 # 5 minutes max timeout for any operation
Specinfra.configuration.winrm = winrm
