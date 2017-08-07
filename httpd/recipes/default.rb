include_recipe 'httpd::loadproductOhai'
product_environment=node['myproduct_ohai_vars']['environment']
product_component=node['myproduct_ohai_vars']['component']
data_bag_obj=data_bag_item('myproduct',product_environment)

package 'install httpd' do
  package_name data_bag_obj[product_component]['package_name']
end

template '/etc/httpd/conf/httpd.conf' do
  source 'httpd.conf.erb'
  variables ( {  :http_port =>  data_bag_obj[product_component]['port'] }) 
end

service 'httpd' do
  action [:enable, :start]
  subscribes :reload, 'template[/etc/httpd/conf/httpd.conf]', :immediately
end

