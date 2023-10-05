# creating a custom HTTP header response using puppet

# Installing nginx server
exec {'Nginx_server-install':
    command => ['sudo apt-get -y update && sudo apt -y install nginx && sudo service nginx start']
    path    =>  ['/bin', '/usr/bin']
}

# Ensure the nginx package is installed
package { 'nginx':
  ensure => installed,
}

# Ensure the nginx service is running and enabled at boot
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

# Capture the hostname using Puppet's facter
$server_hostname = $facts['networking']['hostname']

# Add the custom HTTP header to the default site configuration
file_line { 'nginx_custom_header':
  path    => '/etc/nginx/sites-available/default',
  line    => "add_header X-Served-By ${server_hostname};",
  match   => '^add_header X-Served-By',
  require => Package['nginx'],
  notify  => Service['nginx'],  # Restart Nginx if the file changes
}
