class Gemistics
  module Normalizer
    class Gem
      def initialize(model)
        @model = model
      end

      def model
        OpenStruct.new(MultiJson.load(@model))
      end

      def normalize
        [model.name, model.version, model.downloads]
      end
    end
  end
end
