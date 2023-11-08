# Puppet automation script to replace .phpp with .php
# in wp-settings.php apache server config file

exec { 'correting apache config file':
    path    => ['/bin', '/usr/bin']
    command => "sed -i 's/.phpp/.php/g' /var/www/html/wp-settings.php",
}

