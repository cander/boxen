class people::cander {
  # need to require these items in Puppetfile
  # include tmux iTerm
  include iterm2::stable
  include tmux
  include wget

  # move project from site.pp
  include projects::all
}
