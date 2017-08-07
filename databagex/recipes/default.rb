#
# Cookbook Name:: first
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


data=data_bag_item( 'databagex', 'samp')
template '/tmp/databagex' do
  source 'samp.erb'
  variables( :tempVar => data['tempVar']  )
end
