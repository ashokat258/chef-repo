#include_recipe 'custom_resource.rb'

jenkins_name 'repo_build' do
  action :create_rep
end

jenkins_name 'install_jenkins' do
    action :install
end

jenkins_name 'start_jenkins' do
    action :starts
end
