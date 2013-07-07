class Gemistics
  VERSION = "1.0.0"
  class Version
    SEMVER_FORMAT = /^((\d+)\.(\d+)\.(\d+))(?:-([\dA-Za-z\-]+(?:\.[\dA-Za-z\-]+)*))?(?:\+([\dA-Za-z\-]+(?:\.[\dA-Za-z\-]+)*))?$/
    attr_reader :version
    attr_reader :major, :minor, :patch, :prerelease, :build

    def initialize(version)
      @version = version
      case
        when is_semver?
          semver = @version.match(SEMVER_FORMAT)
          @major = semver[2].to_i
          @minor = semver[3].to_i
          @patch = semver[4].to_i
          @prerelease = semver[5]
          @build = semver[6]
      end
    end

    def <=>(version)
      @major <=> version.major
    end

    def is_semver?
      !(@version =~ SEMVER_FORMAT).nil?
    end

    def is_release?
      is_semver? && @major >= 1
    end

    def is_minor?
      is_semver? && @major.zero? && @minor >= 1
    end

    def is_patch?
      is_semver? && @major.zero? && @minor.zero?
    end
  end
end
