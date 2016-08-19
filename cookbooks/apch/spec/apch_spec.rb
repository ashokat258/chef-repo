require 'chefspec'

describe 'apch::apach' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'installs nginx' do
    expect(chef_run).to install_package('nginx')
  end

  it 'create file' do
    expect(chef_run).to create_template('/usr/share/nginx/html/index.html')
  end
end
