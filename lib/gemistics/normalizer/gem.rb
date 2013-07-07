class Gemistics
  module Normalizer
    class Gem
      def initialize(gem)
        @gem = gem
      end

      def normalize
        @gem.with_indifferent_access.slice("name", "downloads", "version")
      end
    end
  end
end
