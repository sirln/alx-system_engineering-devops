# Puppet automation script to correct apache2 server config file
exec { 'correting apache config file':
    command => "/bin/sed -i 's/.phpp/.php/g' /var/www/html/wp-settings.php",
}

