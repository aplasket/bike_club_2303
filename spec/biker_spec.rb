require "spec_helper"

RSpec.describe Biker do
  before(:each) do
    @biker = Biker.new("Kenny", 30)
  end

  describe "#initialize" do
    it "exists and has attributes" do
      expect(@biker).to be_a(Biker)
      expect(@biker.name).to eq("Kenny")
      expect(@biker.max_distance).to eq(30)
    end

    it "starts with an empty hash of riders" do
      expect(@biker.rides).to eq({})
    end

    it "start with an empty array of acceptable terrains" do
      expect(@biker.acceptable_terrain).to eq([])
    end
  end

  describe "#learn terrain!" do
    it "can add acceptable terrains to arrays" do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)
      expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
    end
  end
end