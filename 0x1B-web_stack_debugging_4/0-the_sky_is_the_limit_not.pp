# ulimit configuration script to increase the amount of requests a nginx server can handle
file {'/etc/default/nginx':
    ensure  => file,
}

file_line {'configure nginx ulimit':
    path  => '/etc/default/nginx',
    line  => 'ULIMIT="-n unlimited"',
    match => '^ULIMIT="-n 15"$',
}

service { 'nginx':
    ensure  => running,
    enable  => true,
    require => File['/etc/default/nginx'],
}
