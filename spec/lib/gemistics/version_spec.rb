require "spec_helper"

describe Gemistics::Version do
  let(:version) { described_class.new(@data) }
  describe "#at_least_major?" do
    it "returns true if version is greater than 1.Y.Z"
  end

  describe "#only_minor?" do
    it "returns true if version is less than 1.Y.Z but greater than 0.1.Z"
  end

  describe "#only_patch?" do
    it "returns true if version is less than 0.1.Z but greater than 0.0.1"
  end

  describe "#<=>" do
    let(:version2) { described_class.new(@data2) }
    let(:spaceship) { version <=> version2 }

    it "returns 1 when comparing 2.0.0 to 1.0.0" do
      @data, @data2 = ["2.0.0", "1.0.0"]
      expect(spaceship).to eq(1)
    end

    it "returns 1 when comparing 1.1.0 to 1.0.0" do
      @data, @data2 = ["1.1.0", "1.0.0"]
      expect(spaceship).to eq(1)
    end

    it "returns 1 when comparing 1.0.1 to 1.0.0" do
      @data, @data2 = ["1.0.1", "1.0.0"]
      expect(spaceship).to eq(1)
    end

    it "returns 1 when comparing 1.0.0 to 0.1.0" do
      @data, @data2 = ["1.0.0", "0.1.0"]
      expect(spaceship).to eq(1)
    end

    it "returns 1 when comparing 1.0.0 to 0.0.1" do
      @data, @data2 = ["1.0.0", "0.0.1"]
      expect(spaceship).to eq(1)
    end

    it "returns 1 when comparing 1.0.0 to 0.0.1" do
      @data, @data2 = ["1.0.0", "0.0.1"]
      expect(spaceship).to eq(1)
    end

    it "returns -1 when comparing 0.0.1 to 1.0.0" do
      @data, @data2 = ["0.0.1", "1.0.0"]
      expect(spaceship).to eq(-1)
    end
    context "for Semantic Versions" do
      it "returns 1 when comparing 1.0.0-a to 1.0.0"
      it "returns 1 when comparing 1.0.0-a1 to 1.0.0-a"
      it "returns 1 when comparing 1.0.0+b to 1.0.0"
      it "returns 1 when comparing 1.0.0+b1 to 1.0.0+b"
      it "returns 1 when comparing 1.0.0-a+b to 1.0.0"
      it "returns 1 when comparing 1.0.0-a+b to 1.0.0-a"
      it "returns 1 when comparing 1.0.0-a+b to 1.0.0+b"
      it "returns 1 when comparing 1.0.0-a1+b to 1.0.0-a+b"
      it "returns 1 when comparing 1.0.0-a+b1 to 1.0.0-a+b"
    end
  end

  describe "semver?" do
    let(:semver?) { version.semver? }

    it "considers 12.34.56-beta+zxp.shn.9f0 to be semver" do
      @data = "12.34.56-beta+zxp.shn.9f0"
      expect(semver?).to be(true)
    end

    it "considers 12.34.56-beta to be semver" do
      @data = "12.34.56-beta"
      expect(semver?).to be(true)
    end

    it "considers 12.34.56+zxp.shn.9f0 to be semver" do
      @data = "12.34.56+zxp.shn.9f0"
      expect(semver?).to be(true)
    end

    it "considers 12.34.56 to be semver" do
      @data = "12.34.56"
      expect(semver?).to be(true)
    end
  end
end
