class Gemistics
  module Request
    class Gem
      include Request
      PROTOCOL = "https"
      HOST = "rubygems.org"
      ENDPOINT = "api/v1/gems"
      FORMAT = "json"

      def initialize(name)
        @name = name
        REDIS.set(key, get) unless REDIS.get(key) && !REDIS.get(key).blank?
        @response = MultiJson.load(REDIS.get(key))
      end

      def to_gem
        Normalizer::Gem.new(@response).normalize
      end

      private

      def url
        "#{PROTOCOL}://#{HOST}/#{ENDPOINT}/#{@name}.#{FORMAT}"
      end

      def get
        begin
          RestClient.get(url)
        rescue RestClient::InternalServerError
          puts "#{@name} failed"
          "{}"
        rescue RestClient::ResourceNotFound
          puts "#{@name} not found"
          "{}"
        end
      end

      def key
        "gem/#{@name}"
      end
    end
  end
end
