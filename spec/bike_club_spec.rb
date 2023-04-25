require "spec_helper"

RSpec.describe BikeClub do
  before(:each) do
    @bike_club1 = BikeClub.new("The Cycle Shop")
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @ride1 = Ride.new({ name: "Walnut Creek Trail", 
                        distance: 10.7, 
                        loop: false, 
                        terrain: :hills})
    @ride2 = Ride.new({ name: "Town Lake", 
                        distance: 14.9, 
                        loop: true, 
                        terrain: :gravel})
  end
  
  describe "#initialize" do
    it "exists and has attributes" do
      expect(@bike_club1).to be_a(BikeClub)
      expect(@bike_club1.name).to eq("The Cycle Shop")
    end

    it "starts with an empty array of bikers" do
      expect(@bike_club1.bikers).to eq([])
    end
  end

  describe "#add new biker" do
    it "can add a biker to the biker array" do
      @bike_club1.add_biker(@biker)
      @bike_club1.add_biker(@biker2)

      expect(@bike_club1.bikers).to eq([@biker, @biker2])
    end
  end

  describe "#most rides" do
    it "returns biker object of who logged most rides" do
      @bike_club1.add_biker(@biker)
      @bike_club1.add_biker(@biker2)
      @biker.learn_terrain!(:gravel)
      @biker.learn_terrain!(:hills)

      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)
      
      @biker2.learn_terrain!(:gravel)
      @biker2.learn_terrain!(:hills)
      @biker2.log_ride(@ride1, 95.0) #can't bike this distance
      @biker2.log_ride(@ride2, 65.0)

      expect(@biker.rides).to eq({@ride1 => [92.5, 91.1],
                                  @ride2 => [60.9, 61.6]})
      expect(@biker2.rides).to eq({@ride2 => [65.0]})
      
      expect(@bike_club1.most_rides).to eq(@biker)

    end
  end
end