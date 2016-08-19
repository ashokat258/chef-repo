cookbook_file "encrypted_data_bag_secret" do
        path "/tmp/encrypted_data_bag_secret"
        action :create_if_missing
end

