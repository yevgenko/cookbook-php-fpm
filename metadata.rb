name             'php-fpm'
maintainer       'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license          'Apache-2.0'
description      'Installs/Configures php-fpm'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.8.0'
chef_version     '>= 12.14'

%w( debian ubuntu centos redhat fedora amazon oracle scientific ).each do |os|
  supports os
end

source_url 'https://github.com/yevgenko/cookbook-php-fpm'
issues_url 'https://github.com/yevgenko/cookbook-php-fpm/issues'
