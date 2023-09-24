# puppet script to set up client SSH configuration file
file_line {'set private key file':
    path     => '/etc/ssh/ssh_config',
    line     => 'IdentityFile ~/.ssh/school',
    match    => '^IdentityFile',
    multiple => true,
    ensure   => present,
}


file_line {'disable password authentication':
    path     => '/etc/ssh/ssh_config',
    line     => 'PasswordAuthentication no',
    match    => '^PasswordAuthentication',
    ensure   => present,
}
