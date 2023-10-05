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

exec { 'add_custom_header':
  environment => ["host=$hostname"],
  provider    => shell,
  command     => 'sudo sed -i "s/include \/etc\/nginx\/sites-enabled\/\*;/include \/etc\/nginx\/sites-enabled\/\*;\n\tadd_header X-Served-By \"$host\";/" /etc/nginx/nginx.conf',
  before      => Exec['restart_nginx'],
}

exec { 'restart_nginx':
  provider => shell,
  command  => 'sudo service nginx restart',
}
