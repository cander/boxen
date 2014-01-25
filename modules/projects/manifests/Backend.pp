# Backend module - includes our antiquated versions of java, groovy, gradle, and hadoop

class projects::backend {
  include java6     # java 1.6u65, which is newer than what we actually run

  # our directory of exploded tarballs for the tools distributed that way
  $nonpkgs = "${boxen::config::home}/nonpkgs"    # e.g.  /opt/boxen/nonpkgs
  $archives = "${nonpkgs}/archives"              # where the tarballs come down

  file { $nonpkgs:
    ensure => directory
  }

  file { $archives:
    ensure => directory
  }

  # ------  gradle  ------
  $gradle_ver = '0.9.2'
  archive { "gradle-$gradle_ver":
    ensure => present,
    url => "http://services.gradle.org/distributions/gradle-$gradle_ver-bin.zip",
    src_target => $archives,
    target => $nonpkgs,
    checksum => false,
  }

  $gradle_wrapper = "${boxen::config::bindir}/gradle"
  file { $gradle_wrapper:
    content  => template('projects/gradle.sh.erb'),
    mode    => '0755',
  }

  # ------  groovy  ------
  $groovy_ver = '1.7.11'
  archive { "groovy-$groovy_ver":
    ensure => present,
    url => "http://dist.groovy.codehaus.org/distributions/groovy-binary-1.7.11.zip",
    src_target => $archives,
    target => $nonpkgs,
    checksum => false,
  }

  # ------  CDH hadoop  ------
  $hadoop_dir = 'hadoop-0.20.2-cdh3u2'
  archive { "$hadoop_dir":
    ensure => present,
    url => "https://s3-us-west-2.amazonaws.com/image-dist/hadoop-0.20.2-cdh3u2.tar.gz",
    src_target => $archives,
    target => $nonpkgs,
    checksum => false,
  }

  # configs for groovy and hadoop
  file { "${boxen::config::envdir}/backend.sh":
    content  => template('projects/backend.sh.erb'),
  }
}
