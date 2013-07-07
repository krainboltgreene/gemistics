require "multi_json"
require "active_support/all"
require "rest-client"
require "hiredis"
require "redis"
require "pry"

require_relative "gemistics/gem"
require_relative "gemistics/request"
require_relative "gemistics/normalizer"
require_relative "gemistics/version"

class Gemistics
  attr_reader :gems
  def initialize
    @names = Request::Gems.new.to_names
    @gems = @names.map { |name| Gem.new(name) }
  end
end
