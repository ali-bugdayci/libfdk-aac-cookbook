#
# Cookbook Name:: libfdk_aac
# Recipe:: source
#
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "build-essential"
include_recipe "git"

libfdk_aac_packages.each do |pkg|
  package pkg do
    action :purge
  end
end


# install prerequisites:

yasm_package = value_for_platform(
  [ "ubuntu" ] => { "default" => "yasm" },
  "default" => "yasm"
)
libtool = value_for_platform(
  [ "ubuntu" ] => { "default" => "libtool" },
  "default" => "libtool"
)
autoconf = value_for_platform(
  [ "ubuntu" ] => { "default" => "autoconf" },
  "default" => "autoconf"
)

package yasm_package do
  action :upgrade
end

package libtool do
  action :install
end

package autoconf do
  action :install
end


git "#{Chef::Config[:file_cache_path]}/libfdk_aac" do
  repository node[:libfdk_aac][:git_repository]
  reference node[:libfdk_aac][:git_revision]
  action :sync
  notifies :run, "bash[compile_libfdk_aac]"
end

bash "compile_libfdk_aac" do
  cwd "#{Chef::Config[:file_cache_path]}/libfdk_aac"
  user "root"
  code <<-EOH
    autoreconf -fiv
    ./configure --prefix=#{node[:libfdk_aac][:prefix]} #{node[:libfdk_aac][:compile_flags].join(' ')}
    make clean && make && make install
  EOH
  creates "#{node[:libfdk_aac][:prefix]}/lib/libfdk-aac.a"
end
