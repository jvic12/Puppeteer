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

}
