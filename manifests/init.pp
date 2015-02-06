class ispconfig_packages {

  include devutils

  if $::lsbdistcodename == 'hardy' {
    softec_php::module { 'mhash': }
  }
  else {
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

  softec_php::module { 'curl': }
  softec_php::module { 'gd': }
  softec_php::module { 'imap': }
  softec_php::module { 'mcrypt': }
  softec_php::module { 'mysql': }
  softec_php::extension { 'dev': }
  softec_php::extension { 'pspell': }
  softec_php::extension { 'recode': }
  softec_php::extension { 'snmp': }
  softec_php::extension { 'sqlite': }
  softec_php::extension { 'tidy': }
  softec_php::extension { 'xmlrpc': }
  softec_php::extension { 'xsl': }

  if !defined(Softec_php::Module['ldap']) {
    softec_php::module{ 'ldap':}
  }

  include softec_php::imagick
  include softec_php::memcache
  include softec_php::uploadprogress

  include softec_php::ming

  include softec_apache::mod::status
  include apache::mod::proxy

  file { '/etc/php5/conf.d/idn.ini':
    ensure  => absent,
  }

  include ispconfig_packages::perlmodules
}
