class Gemistics
  module Request
    class Gem
      include Storable

      SCHEME = "https"
      HOST = "rubygems.org"
      ENDPOINT = "api/v1/gems"
      FORMAT = "json"

      def initialize(name)
        @name = Normalizer::Name.new(name)
        @data = if stored? then get else set end
      end

      def name
        @name.normalize
      end

      def data
        Normalizer::Gem.new(@data)
      end

      def to_response
        Response::Gem.new(*data.normalize)
      end

      private

      def database_key
        name
      end

      def to_uri
        URI::Generic.build(scheme: SCHEME, host: HOST, path: path)
      end

      def path
        "/#{ENDPOINT}/#{URI.encode(name)}.#{FORMAT}"
      end

      def raw
        begin
          RestClient.get(to_uri.to_s)
        rescue RestClient::InternalServerError
          puts("#{name} failed") and {}
        rescue RestClient::ResourceNotFound
          puts("#{name} not found") and {}
        end
      end
    end
  end
end
