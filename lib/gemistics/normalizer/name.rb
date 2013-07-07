class Gemistics
  module Normalizer
    class Name
      def initialize(name)
        @name = name
      end

      def normalize
        @name.gsub(/\s\(.+\)/, "")
      end
    end
  end
end
