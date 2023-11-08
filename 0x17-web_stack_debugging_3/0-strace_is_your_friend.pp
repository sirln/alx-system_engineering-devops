# Puppet automation script to correct apache2 server config file
exec { 'correting apache config file' :
    command => "/bin/sed -i 's/.phpp/.php/g /var/www/html/wp-settings.php'"
}

#command => "sed -i 's/.phpp/.php/g /var/www/html/wp-settings.php'"
#path => ['/bin', '/usr/bin']

