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

yasm_package = value_for_platform(
  [ "ubuntu" ] => { "default" => "yasm" },
  "default" => "yasm"
)

package yasm_package do
  action :upgrade
end

git "#{Chef::Config[:file_cache_path]}/libfdk_aac" do
  repository node[:libfdk_aac][:git_repository]
  reference node[:libfdk_aac][:git_revision]
  action :sync
  notifies :run, "bash[compile_libfdk_aac]"
end

bash "compile_libfdk_aac" do
  cwd "#{Chef::Config[:file_cache_path]}/libfdk_aac"
  code <<-EOH
    autoreconf -fiv
    ./configure --prefix=#{node[:libfdk_aac][:prefix]}
    make clean && make && make install
  EOH
  creates "#{node[:libfdk_aac][:prefix]}/bin/fdk-aac"# ???
end
