#
# Author::  Seth Chisamore (<schisamo@opscode.com>)
# Cookbook Name:: php-fpm
# Recipe:: package
#
# Copyright 2011-2017, Chef Software, Inc.
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

case node['platform']
when 'debian'
  # Configure Dotdeb repos
  # TODO: move this to it's own 'dotdeb' cookbook?
  # http://www.dotdeb.org/instructions/
  if node['platform_version'].to_f >= 8.0
    apt_repository 'dotdeb' do
      uri node['php-fpm']['dotdeb_repository']['uri']
      distribution 'jessie'
      components ['all']
      key node['php-fpm']['dotdeb_repository']['key']
      action :add
    end
  elsif node['platform_version'].to_f >= 7.0
    apt_repository 'dotdeb' do
      uri node['php-fpm']['dotdeb_repository']['uri']
      distribution 'wheezy'
      components ['all']
      key node['php-fpm']['dotdeb_repository']['key']
      action :add
    end
  end

when 'amazon', 'fedora', 'centos', 'redhat', 'scientific', 'oracle'
  unless platform?('centos', 'redhat') && node['platform_version'].to_f >= 6.4 # ~FC024
    yum_repository 'remi' do
      description 'Remi'
      url node['php-fpm']['yum_url']
      mirrorlist node['php-fpm']['yum_mirrorlist']
      gpgkey 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
      action :add
    end
  end
end
