class Gemistics
  class Version
    class SemanticVersion
      VERSION_TOKEN = /\d+/
      DELIMITER_TOKEN = /\./
      METADATA_TOKEN = /[\dA-Za-z\-]+(#{DELIMITER_TOKEN}[\dA-Za-z\-]+)*/

      BUILD_TOKEN = /\+/
      PRE_TOKEN = /\-/

      PRE = /#{PRE_TOKEN}(?<pre>#{METADATA_TOKEN})/
      BUILD = /#{BUILD_TOKEN}(?<build>#{METADATA_TOKEN})/

      PATCH = /(?<patch>#{VERSION_TOKEN})/
      MINOR =/(?<minor>#{VERSION_TOKEN})#{DELIMITER_TOKEN}/
      MAJOR = /(?<major>#{VERSION_TOKEN})#{DELIMITER_TOKEN}/

      CORE = /#{MAJOR}#{MINOR}#{PATCH}/
      META = /(#{PRE}#{BUILD}|#{PRE}|#{BUILD})?/

      PATTERN = /^#{CORE}#{META}/

      def initialize(version)
        @version = version
        @match = version.match(PATTERN)
      end

      def major
        @match[:major]
      end

      def minor
        @match[:minor]
      end

      def patch
        @match[:patch]
      end

      def pre
        @match[:pre]
      end

      def build
        @match[:build]
      end
    end
  end
end
