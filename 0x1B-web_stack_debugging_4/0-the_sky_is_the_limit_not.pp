# ulimit configuration script to increase the amount of requests a nginx server can handle
file {'/etc/default/nginx':
    ensure  => file,
}

exec { 'adjust-nginx-server-ulimit':
  command => 'sed -i \'s/^ULIMIT="-n 15"$/ULIMIT="-n unlimited"/\' /etc/security/limits.conf',
  path    => '/usr/local/bin/:/bin/',
  notify  => Service['nginx'],
  refreshonly => true,
}
