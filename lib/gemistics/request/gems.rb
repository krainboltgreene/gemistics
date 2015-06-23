class Gemistics
  module Request
    class Gems
      include Enumerable
      include Storable

      DATABASE_KEY = "gems"

      def initialize
        @raws = data.map(&:to_response)
      end

      def to_responses
        Response::Gems.new(@raws)
      end

      def each(&block)
        to_response.each(&block)
      end

      def names
        if stored? then get else set end
      end

      def data
        names.map { |name| Request::Gem.new(name) }
      end

      private

      def database_key
        DATABASE_KEY
      end

      def raw
        `gem list -r`.split("\n").first(2)
      end
    end
  end
end
