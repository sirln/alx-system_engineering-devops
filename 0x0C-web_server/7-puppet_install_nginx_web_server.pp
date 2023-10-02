# Puppet script to install und configure Nginx Web Server

# Load the ubuntu/debian package repo manager
include apt

# Update the repo manager
exec {'apt update':
    command     => 'apt-get update',
    path        => ['/bin', '/usr/bin']
}

# Ensure nginx is installed
package { 'nginx':
    ensure => installed,
}

# Ensure nginx service is running and enabled on boot
service { 'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx'],
}

# Create the directory where our Hello World page will be located
file { 
    path    => '/var/www/html':
    ensure  => 'directory',
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0755',
}

# Create the Hello World page
file { 'index file'
    path    => '/var/www/html/index.html',
    ensure  => 'file',
    content => 'Hello World!',
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0644',
    require => File['/var/www/html'],
}

$configs = "server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.html;
    
    location / {
        try_files $uri $uri/ =404;
    }
    
    location /redirect_me {
        return 301 https://www.sirlawren.com;
    }
}"

# Configure the default nginx site
file { 'server_config':
    path    => '/etc/nginx/sites-available/default',
    ensure  => 'file',
    content => $configs,
    notify  => Service['nginx'],
}


# Ensure nginx is reloaded if the configuration changes
exec { 'reload-nginx':
    command     => 'service nginx reload',
    path        => ['/bin', '/usr/bin'],
    refreshonly => true,
    subscribe   => File['/etc/nginx/sites-available/default'],
}
