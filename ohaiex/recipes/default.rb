plugin_path=Ohai::Config[:plugin_path].first
ohai "reload" do
  plugin "myproduct_ohai_vars"
  action :nothing
end

template "#{plugin_path}/myproduct_ohai_vars.rb" do
  source 'myproduct_ohai_vars.erb'
  action :create
  notifies :reload, "ohai[reload]", :immediately
end


package 'install httpd' do

  package_name 'httpd'
end

service 'httpd' do
  action [:enable, :start]
end
