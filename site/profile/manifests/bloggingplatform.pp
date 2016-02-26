class profile::bloggingplatform(
$docroot = '/var/www/wordpress',
){

#Manage Wordpress
class { 'wordpress':
  install_dir => '/var/www/wordpress',
  db_name     => 'wordpress',
  db_host     => 'localhost',
  db_user     => 'wordpress',
  db_password => 'insecure password',
}

#Manage Apache

#Manage mysql
class { 'mysql::server':
  root_password = 'insecure password',
}



#Manage PHP
include apache::mod::php


apache::vhost { $fqdn:
  docroot => $docroot,
  manage_docroot => false,
}




}
