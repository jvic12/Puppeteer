node "avm6.llnl.gov" {

file { '/etc/hosts':
    ensure => "file",
    owner  => "root",
    group  => "root",
    mode   => "700",
    source => "~/Puppeteer/hosts",
}

file {'/etc/resolv.conf':
   ensure => "file",
   owner => "root",
   group => "root",
   mode => "700".
   source => "~/Puppeteer/resolv.conf",
}

}