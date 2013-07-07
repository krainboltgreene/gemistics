class Gemistics
  module Request
    class Gems
      def initialize
        @response = `gem list -r`.split("\n")
      end

      def to_names
        @response.map { |item| Normalizer::Name.new(item).normalize }
      end
    end
  end
end
