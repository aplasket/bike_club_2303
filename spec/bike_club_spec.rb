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
end