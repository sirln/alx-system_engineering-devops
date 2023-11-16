# ulimit configuration script to increase the amount of requests a nginx server can handle
exec { 'adjust_nginx_ulimit':
  command => 'sed -i \'s/^ULIMIT="-n 15"$/ULIMIT="-n unlimited"/\' /etc/default/nginx',
  path    => '/usr/bin:/bin',
}

exec { 'restart_nginx':
  provider => shell,
  command  => 'sudo service nginx restart',
}
