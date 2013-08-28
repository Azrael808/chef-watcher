#
# Cookbook Name:: watcher
# Recipe:: default
#
# Copyright 2013, Dachis Group
#
# All rights reserved - Do Not Redistribute
include_recipe "git"
include_recipe "python"

package "libyaml-devel"

python_pip "pyinotify" do
  action :install
end

python_pip "PyYAML" do
  action :install
end

git "clone watcher repo" do
  repository node['watcher']['repo_url']
  revision node['watcher']['branch']
  destination node['watcher']['install_path']
  action :sync
end

template "/etc/init.d/watcher" do
  source "watcher.init.d.sh.erb"
  owner "root"
  group "root"
  mode "0755"
  variables "binary" => "/usr/local/watcher/watcher.py"
end

directory "/root/.watcher" do
  action :create
end

service "watcher" do
  action [ :start, :enable ]
end

