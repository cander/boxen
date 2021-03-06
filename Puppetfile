# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

forge "http://forge.puppetlabs.com"
mod "smarchive/archive"

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen",      "3.0.2"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "autoconf",   "1.0.0"
github "dnsmasq",    "1.0.0"
github "gcc",        "2.0.1"
github "git",        "1.2.5"
github "homebrew",   "1.4.1"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "openssl",    "1.0.0"
github "repository", "2.2.0"
github "ruby",       "6.3.4"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

# Project things
github "mysql",     "1.1.5"
github "redis",     "0.3.0"     # redis 2.6.9 - not what we run in production
github "java6",     "0.0.1", :repo => "cander/puppet-java6"

# Personal things
github "iterm2",    "1.0.3"
github "tmux",      "1.0.2"
github "wget",      "1.0.0"
github "ctags",     "1.0.0"
github "virtualbox","1.0.10"  # virtualbox 4.3.6
github "vagrant",   "3.0.2"   # vagrant 1.4.1
