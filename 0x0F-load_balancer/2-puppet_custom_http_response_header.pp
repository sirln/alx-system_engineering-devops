# add a custom HTTP header X-Served-By

exec {'update_system':
  command => '/usr/bin/apt-get -y update',
  before  => Exec['install_nginx'],
}

exec {'install_nginx':
  provider => shell,
  command  => 'sudo apt-get -y install nginx',
  before   => Exec['add_custom_header'],
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

exec { 'restart_nginx':
  provider => shell,
  command  => 'sudo service nginx restart',
}
