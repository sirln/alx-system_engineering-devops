# puppet script to kill the killmenow process
exec {'kill killmenow process':
    command => '/usr/bin/pkill killmenow',
}
