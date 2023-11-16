# ulimit configuration script to increase the amount of requests a nginx server can handle
file {'/etc/default/nginx':
    ensure  => file,
}

exec { 'adjust_nginx_ulimit':
  command     => 'sed -i \'s/^ULIMIT="-n 15"$/ULIMIT="-n unlimited"/\' /etc/default/nginx',
  path        => '/usr/bin:/bin',
  notify      => Service['nginx'],
  refreshonly => true,
}
