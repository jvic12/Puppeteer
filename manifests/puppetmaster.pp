node "avm6.llnl.gov" {

file { '/etc/hosts':
    ensure => "file",
    owner  => "root",
    group  => "root",
    mode   => "644",
    source => "/root/Puppeteer/hosts",
}

file {'/etc/resolv.conf':
   ensure => "file",
   owner => "root",
   group => "root",
   mode => "644",
   source => "/root/Puppeteer/resolv.conf",
}

cron{'gitPull':
   command => 'cd /root/Puppeteer/ && git pull',
   user => 'root',
   hour => '*',
   minute => '*/1',
}

cron{'apply':
   command => 'puppet apply /root/Puppeteer/manifests/puppetmaster.pp',
   user => 'root',
   hour => 8,
   minute => 0,
}

user { 'jvic':
   ensure => 'present',
   uid => 1000,
   gid => 1000,
   groups => 'wheel',
}

}
