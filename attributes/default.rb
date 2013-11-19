#
# Cookbook Name:: libfdk_aac
# Attributes:: default
#
# Author:: Jamie Winsor (<jamie@vialstudios.com>)
#
# Copyright 2011, En Masse Entertainment, Inc.
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

default[:libfdk_aac][:install_method] = :source
default[:libfdk_aac][:git_repository] = "git://github.com/mstorsjo/fdk-aac.git"
default[:libfdk_aac][:prefix] = "/usr/local"

default[:libfdk_aac][:compile_flags] = []

# JW 07-06-11: Hash of commit or a HEAD should be used - not a tag. Sync action of Git
# provider will always attempt to update the git clone if a tag is used.

#default[:libfdk_aac][:git_revision]   = "78443185d4f09dd1ffd459dd333407d2458fb4e4" # v0.1.0
default[:libfdk_aac][:git_revision]   = "f6aebfd48733366a6f915b4a6bdb31d9df15bac3" # v0.1.2
