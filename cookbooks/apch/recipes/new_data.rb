#chef_gem "chef-vault"
#require 'chef-vault'
#require "chef-vault::default"

#data=search(:vhost, "id:bear").first
data = data_bag_item("vhost","bear")
#id = data['id']
#port = data['port']

file "/etc/my_file" do
  content data["port"].to_s
  mode 00644
  not_if {data.empty?}
  action :create # must have action, chefspec will not default action :create
end

#puts "id id= #{id}"
#puts "port = #{port}"


#item = search(:passords, "id:root").first
#//apassword = chef_vault_item('passords','root')
#chef_gem "chef-vault"

#require 'chef-vault'

#items = ChefVault::Item.load("bingo", "root")
#new = items['password']
#user = items['username']
#puts "word =#{new} & user = #{user}"
#puts "pass = #{item['password']}"
