class Gemistics
  class Gem
    attr_reader :name
    attr_reader :version
    attr_reader :downloads

    def initialize(name)
      @data = Request::Gem.new(name).to_gem
      @name = @data["name"]
      @version = Version.new(@data["version"])
      @downloads = @data["downloads"]
    end
  end
end
