#
# Cookbook Name:: nginx
# Attributes:: devel
#
# Author:: Arthur Freyman (<afreyman@riotgames.com>)
#
# Copyright 2013, Riot Games
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

default['nginx']['devel']['version']  = '0.2.19'
default['nginx']['devel']['url']      = "https://github.com/simpl/ngx_devel_kit/archive/v#{node['nginx']['devel']['version']}.tar.gz"
default['nginx']['devel']['checksum'] = '501f299abdb81b992a980bda182e5de5a4b2b3e275fbf72ee34dd7ae84c4b679'
