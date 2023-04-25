require "spec_helper"

RSpec.describe Biker do
  before(:each) do
    @biker = Biker.new("Kenny", 30)
    @ride1 = Ride.new({ name: "Walnut Creek Trail", 
                        distance: 10.7, 
                        loop: false, 
                        terrain: :hills})
    @ride2 = Ride.new({ name: "Town Lake", 
                        distance: 14.9, 
                        loop: true, 
                        terrain: :gravel})

    @biker2 = Biker.new("Athena", 15)
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

  describe "#log ride" do
    it "logs the ride" do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)

      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)

      expected = {@ride1 => [92.5, 91.1],
                  @ride2 => [60.9, 61.6]}

      expect(@biker.rides).to eq(expected)

      @biker2.log_ride(@ride1, 97.0) #doesn't know terrain
      @biker2.log_ride(@ride2, 67.0) #doesn't know terrain
      expect(@biker2.rides).to eq({})

      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      @biker2.log_ride(@ride1, 95.0) #can't bike this distance
      @biker2.log_ride(@ride2, 65.0) #yes! can bike this distance ride.total distce < biker.max_distance

      expect(@biker2.rides).to eq({@ride2 => [65.0]})
    end
  end

  describe "#personal record" do
    it "logs the personal record" do
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)

      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)

      expect(@biker.personal_record(@ride1)).to eq(91.1)
      expect(@biker.personal_record(@ride2)).to eq(60.9)

      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      @biker2.log_ride(@ride1, 95.0)
      @biker2.log_ride(@ride2, 65.0)
      expect(@biker2.personal_record(@ride2)).to eq(65.0)
      expect(@biker2.personal_record(@ride1)).to eq(false)
    end
  end
end