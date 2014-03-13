# Project Manifests
Project manifests live in `modules/projects/manifests/$project.pp`.

## Our Projects
We currently have projects defined for:

* xydo_biz - included by default in `manifests/site.pp`
* Gravit
* Backend
* all - all of the projects

So far, we don't have any company-specified information in these Boxen project definitions.  It looks like you could have them check out repositories, set up databases, and more, but we're not doing that yet.

Beware: when Boxen installs mysql and redis, it runs them on non-standard
ports, so they don't conflict with any existing installs.  Therefore, you
may need to update your YML files to use the environment variables that
contain those port numbers.

## New Projects

Project manifests live in `modules/projects/manifests/$project.pp`. A
simple project manifest example:

```puppet
class projects::trollin {
  include icu4c
  include phantomjs

  boxen::project { 'trollin':
    dotenv        => true,
    elasticsearch => true,
    mysql         => true,
    nginx         => true,
    redis         => true,
    ruby          => '1.9.3',
    source        => 'boxen/trollin'
  }
}
```

With the above, as long as our app is configured to listen on a **socket** at
`"#{ENV['BOXEN_SOCKET_DIR']}"/trollin`, you'll now be able to run its local
server and visit http://trollin.dev/ to access the app in dev.

Provide the full repository URL in the 'source' option when referencing
code that is not hosted at github.com, such as Github Enterprise
repositories.

For further documentation on how to use the `boxen::project` type,
take a look at the documentation in the
[source](https://github.com/boxen/puppet-boxen/blob/master/manifests/project.pp#L1-L61).
