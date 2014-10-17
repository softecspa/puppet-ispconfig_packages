class ispconfig_packages::perlmodules {
  package {
    'libhtml-parser-perl':       ensure => present;
    'libdb-file-lock-perl':      ensure => present;
    'libnet-dns-perl':           ensure => present;
    'libnetaddr-ip-perl':        ensure => present;
    'liblist-moreutils-perl':    ensure => present;
  }

  case $::lsbdistcodename {
    'hardy': {
      # 'libarchive-tar-perl' in lucid sta in 'perl-modules' (core)
      package { 'libarchive-tar-perl':
        ensure  => present;
      }
    }

    'lucid': {
      #546: solo 10.04
      package {
        'libarray-unique-perl':     ensure => present;
        'libnagios-plugin-perl':    ensure => present;
      }
    }
  }
}
