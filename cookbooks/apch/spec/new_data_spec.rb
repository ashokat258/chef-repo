require 'bundler/setup'
require 'chefspec'

describe 'apch::new_data' do
  let (:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }
  it 'stub out data_bag_item' do
 #   Chef::Recipe.stub(:data_bag_item).and_return(Hash.new)
  #  Chef::Recipe.stub(:data_bag_item).with("bear", "id").and_return({"id" => "ashok", "port" => "80"})a
    stub_data_bag('vhost').and_return(['bear']) 
    stub_data_bag_item("vhost","bear").and_return(['port'].to_s)
    expect(chef_run).to create_file('/etc/my_file')
  end
end
