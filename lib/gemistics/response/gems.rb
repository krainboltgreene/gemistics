class Gemistics
  module Response
    class Gems
      extend Forwardable
      include Enumerable

      def_delegator :@models, :size

      def initialize(models)
        @models = models
      end

      def each(&block)
        @models.each(&block)
      end
    end
  end
end
