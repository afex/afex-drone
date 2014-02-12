require 'spec_helper_system'

describe 'drone' do
	context 'should install correctly' do
		pp = <<-EOS
			class { 'drone': }
		EOS

		context puppet_apply(pp) do
			its(:stderr) { should == "" }
			its(:exit_code) { should_not == 1 }
			its(:refresh) { should be_nil }
			its(:stderr) { should == "" }
			its(:exit_code) { should be_zero }
		end

		describe file('/tmp/drone.deb') do
			it { should be_file }
		end

		describe package('drone') do
			it { should be_installed }
		end
	end
end