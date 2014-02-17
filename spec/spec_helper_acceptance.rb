require 'beaker-rspec/spec_helper'
require 'beaker-rspec/helpers/serverspec'
require 'beaker/librarian'

RSpec.configure do |c|
	proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

	c.before :suite do
		install_puppet
		install_librarian
		librarian_install_modules(proj_root, 'drone')
	end
end