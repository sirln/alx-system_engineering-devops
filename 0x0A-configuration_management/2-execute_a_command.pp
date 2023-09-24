# puppet script to kill the killmenow process
exec {'kill killmenow process':
    command => 'pkill killmenow',
    path    => ['/bin', '/usr/bin']
}
