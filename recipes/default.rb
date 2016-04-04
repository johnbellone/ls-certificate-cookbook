#
# Cookbook: tls
# License: Apache 2.0
#
# Copyright 2016, Bloomberg Finance L.P.
#
include_recipe 'chef-sugar::default', 'chef-vault::default'

chef_gem 'vault' do
  version '~> 0.4'
  compile_time true
end
