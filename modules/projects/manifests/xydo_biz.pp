
class projects::xydo_biz {
  # someday this could/should use the boxen::project helper
  # want to figure out the repo/project dir stuff in the helper
  # it seems to want to put projects under /opt, which I don't necessarily
  # belive in

  require ruby::1_9_3_p194

  include mysql
  # mysql::db

  # I'd like to set the Redis version way back to what we're using in
  # production, but I don't think this module and its brew take a version number
  include redis
}
