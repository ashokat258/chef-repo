resource_name :jenkins_name
#property :jenkins 
default_action :create_rep

action :create_rep do
   bash 'add repo' do
     code <<-EOH
         wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
         rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
      EOH
   end
end
  

action :install do
    package 'java-1.7.0-openjdk'
    package 'httpd'
    package 'jenkins' 
end

action :starts do
  service 'httpd' do
    action [:enable, :start]
  end
  service 'jenkins' do
     action [:enable, :start]
   end

end

