require 'rspec-system/spec_helper'
require 'rspec-system-puppet/helpers'
require 'rspec-system-serverspec/helpers'

include RSpecSystemPuppet::Helpers

RSpec.configure do |c|
	proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
	c.tty = true
	c.before :suite do
		puppet_install
		puppet_module_install(source: proj_root, module_name: 'drone')
	end
end