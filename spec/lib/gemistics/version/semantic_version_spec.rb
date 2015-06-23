require "spec_helper"

describe Gemistics::Version::SemanticVersion do
  let(:version) { described_class.new(@data) }

  describe "#major" do
    let(:major) { version.major }

    it "returns the major version number" do
      @data = "12.34.56-beta+zxp.shn.9f0"
      expect(major).to eq("12")
    end
  end

  describe "#minor" do
    let(:minor) { version.minor }

    it "contains the minor version number" do
      @data = "12.34.56-beta+zxp.shn.9f0"
      expect(minor).to eq("34")
    end
  end

  describe "#patch" do
    let(:patch) { version.patch }

    it "contains the patch level" do
      @data = "12.34.56-beta+zxp.shn.9f0"
      expect(patch).to eq("56")
    end
  end

  describe "#pre" do
    let(:pre) { version.pre }

    it "contains the pre-release label" do
      @data = "12.34.56-beta+zxp.shn.9f0"
      expect(pre).to eq("beta")
    end
  end

  describe "#build" do
    let(:build) { version.build }

    it "contains the build name" do
      @data = "12.34.56-beta+zxp.shn.9f0"
      expect(build).to eq("zxp.shn.9f0")
    end
  end
end
