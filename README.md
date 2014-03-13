# Our Boxen

This is a Boxen project copied and hacked from the
[our-boxen](https://github.com/boxen/our-boxen)template projext.


## Getting Started

To give you a brief overview, we're going to:

* Install dependencies (basically Xcode)
* Clone this repo and install Boxen

There are a few potential conflicts to keep in mind.
Boxen does its best not to get in the way of a dirty system,
but you should check into the following before attempting to install your
boxen on any machine (we do some checks before every Boxen run to try
and detect most of these and tell you anyway):

* Boxen __requires__ at least the Xcode Command Line Tools installed.
* Boxen __will not__ work with an existing rvm install.
* Boxen __may not__ play nice with a GitHub username that includes dash(-)
* Boxen __may not__ play nice with an existing rbenv install.
* Boxen __may not__ play nice with an existing chruby install.
* Boxen __may not__ play nice with an existing homebrew install.
* Boxen __may not__ play nice with an existing nvm install.
* Boxen __recommends__ installing the full Xcode, but it works with just the command line tools.

### Dependencies

**Install the Xcode Command Lines Tools and/or full Xcode.**
This will grant you the most predictable behavior in building apps like
MacVim.

How do you do it?

1. Install Xcode from the Mac App Store.
1. Open Xcode.
1. Open the Preferences window (`Cmd-,`).
1. Go to the Downloads tab.
1. Install the Command Line Tools.

### Initial Set up


Once you've done that, run the following to bootstrap
your boxen:

```
sudo mkdir -p /opt/boxen
sudo chown ${USER}:staff /opt/boxen
git clone https://github.com/cander/boxen /opt/boxen/repo
cd /opt/boxen/repo
script/boxen
```
That should grind for a while and download a bunch of stuff - make sure you have bandwidth for this.

Unlike GitHub's Boxen, ours does not (yet) require you to encrypt your hard 
drive by default.  Heads up - it does set a pretty tight policy for putting 
your machine to sleep and requiring a password to wake up.


It should run successfully, and should tell you to source a shell script
in your environment.
For users without a bash or zsh config or a `~/.profile` file,
Boxen will create a shim for you that will work correctly.
If you do have a `~/.bashrc` or `~/.zshrc`, your shell will not use
`~/.profile` so you'll need to add a line like so at _the end of your config_:

``` sh
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
```

Once your shell is ready, open a new tab/window in your Terminal
and you should be able to successfully run `boxen --env`.
If that runs cleanly, you're in good shape.

## What You Get

This project provides the following by default (a subset of what [our-boxen](https://github.com/boxen/our-boxen)
provides):

* Homebrew
* Git
* dnsmasq w/ .dev resolver for localhost
* rbenv
* Ruby 1.9.3
* ack
* Findutils
* GNU tar

## Projects and People

* The base configuration is defind in `site.pp`. It brings in the xydo_biz project.
* There are additional project definitions for Gravit and Backend.  (Nothing
for xydo_digest, yet.) See [the documentation in the
`modules/projects`](modules/projects/README.md)
directory for creating organization projects (i.e., repositories that people
will be working in).
* You can define your own personal items via a personal manifest. See [the documentation in the
`modules/people`](modules/people/README.md)
directory for creating per-user modules that don't need to be applied
globally to everyone. For an example, see
`modules/people/manifests/cander.pp`.

## Customization
* to add more packages, you first need to make the package available 
in the `Puppetfile` and then `include` it in a project or personal manifest.
* See the [our-boxen](https://github.com/boxen/our-boxen)documentation for more details.

