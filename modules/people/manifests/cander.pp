class people::cander {
  # need to require these items in Puppetfile
  include iterm2::stable
  include tmux
  include wget
  include ctags

  include vagrant
  include virtualbox

  # move project from site.pp
  include projects::all
}
