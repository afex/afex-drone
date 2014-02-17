require 'beaker-rspec/spec_helper'
require 'beaker-rspec/helpers/serverspec'

hosts.each do |host|
	install_puppet
end

RSpec.configure do |c|
	proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

	c.before :suite do
		puppet_module_install(:source => proj_root, :module_name => 'drone')
	end
end