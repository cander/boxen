# Backend module - includes our antiquated versions of java, groovy, gradle, and hadoop

class projects::backend {
  include java6

  # our directory of exploded tarballs for the tools distributed that way
  $nonpkgs = "${boxen::config::home}/nonpkgs"
  $archives = "${nonpkgs}/archives"

  file { $nonpkgs:
    ensure => directory
  }

  file { $archives:
    ensure => directory
  }

  $gradle_ver = '0.9.2'
  archive { "gradle-$gradle_ver":
    ensure => present,
    url => "http://services.gradle.org/distributions/gradle-$gradle_ver-bin.zip",
    #url => 'file://localhost/Users/charles/NoBackup/gradle-0.9.2.tgz',
    src_target => $archives,
    target => $nonpkgs,
    checksum => false,
  }

  $gradle_wrapper = "${boxen::config::bindir}/gradle"
  file { $gradle_wrapper:
    content  => template('projects/gradle.sh.erb'),
    mode    => '0755',
  }
}
