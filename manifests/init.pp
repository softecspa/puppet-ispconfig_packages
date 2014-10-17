class ispconfig_packages {

  include devutils

  if $::lsbdistcodename == 'hardy' {
    php5::module { 'mhash': }
    Php5::Module { ensure => present}
  }
  else {
    Php5::Module { ensure => 'pin'}
    package{'apache2-suexec-custom': ensure => present }
  }

	package {
		'fetchmail':                ensure => present;
		'flex':                     ensure => present;
		'libarchive-zip-perl':      ensure => present;
		'libcompress-zlib-perl':    ensure => present;
		'libpcre3':                 ensure => present;
		'libpopt-dev':              ensure => present;
		'lynx':                     ensure => present;
		'ncftp':                    ensure => present;
		'perl-modules':             ensure => present;
		'zlib1g-dev':               ensure => present;
    'bison':                    ensure => present;
	}

  php5::module { 'dev': }
  php5::module { 'curl': }
  php5::module { 'gd': }
  php5::module { 'imap': }
  php5::module { 'mcrypt': }
  php5::module { 'mysql': }
  php5::module { 'pspell': }
  php5::module { 'recode': }
  php5::module { 'snmp': }
  php5::module { 'sqlite': }
  php5::module { 'tidy': }
  php5::module { 'xmlrpc': }
  php5::module { 'xsl': }

  if !defined(Php5::Module['ldap']) {
    php5::module{ 'ldap':
      ensure  => 'pin',
    }
  }

  # Packages not taken from ondrej, so no pin
  php5::module { 'imagick':
    ensure => present;
  }

  include php5::memcache
  include php5::uploadprogress

  php5::module { 'ming':
    ensure => present;
  }

  file { '/etc/php5/conf.d/ming.ini':
    ensure  => 'present',
    mode    => 0644,
    owner   => 'root',
    group   => 'root',
    source  => 'puppet:///modules/php5/ming.ini'
  }

  include apache2::mod::status
  include apache2::mod::proxy

  file { '/etc/php5/conf.d/idn.ini':
    ensure  => absent,
  }

  include ispconfig_packages::perlmodules
}
