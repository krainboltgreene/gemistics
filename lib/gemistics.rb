require "multi_json"
require "active_support/all"
require "rest-client"
require "ostruct"
require "moneta"
require "oj"

class Gemistics
  def self.db
    @db ||= Moneta.new(:Memory, expires: false, serializer: :json)
  end

  def self.db=(database, options = { expires: false, serializer: :json })
    @db = Moneta.new(database, options)
  end

  def initialize
    @gems = Request::Gems.new
  end

  def gems
    @gems.to_responses
  end

  def total
    gems.size
  end

  def semvers
    gems.select(&:matches_semver?)
  end
end

require_relative "gemistics/storable"
require_relative "gemistics/request"
require_relative "gemistics/response"
require_relative "gemistics/normalizer"
require_relative "gemistics/version"
