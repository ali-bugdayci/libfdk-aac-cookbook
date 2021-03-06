#
# Cookbook Name:: libfdk_aac
# Library:: helpers
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

module Libfdk_aac
  module Helpers
    def libfdk_aac_packages
      [
        "fdk-aac"
      ]
    end
  end
end

class Chef::Recipe
  include Libfdk_aac::Helpers
end
