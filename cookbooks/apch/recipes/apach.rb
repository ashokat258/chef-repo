execute "yum update" do
 command "yum update -y"
end

package 'epel-release' do
   action :install
end
package 'nginx' do
  action :install
end

service 'nginx' do
  action [ :start, :enable ]
end

node.default['apch']['ashok']="GREAT"
template "/usr/share/nginx/html/index.html" do
  source "index.html.erb"
  mode "0755"
  variables(:hello => node['apch']['ashok'])
end
