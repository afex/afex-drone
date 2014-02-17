require 'spec_helper_acceptance'

describe 'drone' do
	context 'default parameters' do
		it 'should install correctly' do
			pp = <<-EOS
				class { 'drone': }
			EOS

			expect(apply_manifest(pp).exit_code).to_not eq(1)
			expect(apply_manifest(pp).exit_code).to eq(0)
		end

		describe file('/tmp/drone.deb') do
			it { should be_file }
		end

		describe package('drone') do
			it { should be_installed }
		end
	end
end