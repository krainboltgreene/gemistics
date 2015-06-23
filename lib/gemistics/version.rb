class Gemistics
  VERSION = "1.0.0"

  class Version
    extend Forwardable

    delegate major: :@engine
    delegate minor: :@engine
    delegate patch: :@engine
    delegate pre: :@engine
    delegate build: :@engine

    def initialize(raw)
      @engine = case
        when !!(raw =~ SemanticVersion::PATTERN) then SemanticVersion.new(raw)
      end
    end

    def <=>(other)
      case
        when to_a.size == other.to_a.size then to_a <=> other.to_a
        when to_a.size > other.to_a.size then 1
        when to_a.size < other.to_a.size then -1
      end
    end

    def to_a
      [major, minor, patch, pre, build].compact
    end

    def semver?
      @engine.is_a?(Gemistics::Version::SemanticVersion)
    end
  end
end

require_relative "version/semantic_version"
