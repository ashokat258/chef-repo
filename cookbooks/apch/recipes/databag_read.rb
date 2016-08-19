node.default["apch"]["secretpath"] = "/tmp/encrypted_data_bag_secret"
template "/tmp/databag" do
#    secret = Chef::EncryptedDataBagItem.load_secret("#{node[:apch][:secretpath]}")
    secret = Chef::EncryptedDataBagItem.load_secret(node["apch"]["secretpath"])
    secret_keys = Chef::EncryptedDataBagItem.load("mydatabag", "secretstuff", secret)

 variables(
    password: secret_keys['firstscret'],
    user: secret_keys['id']
 )
    owner "root"
    source "databag_template.erb"
end

