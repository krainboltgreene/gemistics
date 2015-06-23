class Gemistics
  module Response
    class Gem
      extend Forwardable

      attr_reader :name
      attr_reader :version
      attr_reader :downloads

      def_delegator :@version, :matches_semver?

      def initialize(name, version, downloads)
        @name = name
        @version = Version.new(version)
        @downloads = downloads
      end
    end
  end
end
