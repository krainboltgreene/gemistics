require_relative "request/gems"
require_relative "request/gem"

class Gemistics
  module Request
    REDIS = Redis.new(db: 9, driver: :hiredis)
  end
end
