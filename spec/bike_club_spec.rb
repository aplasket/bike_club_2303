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
      expect(@biker.total_rides).to eq(4)
      expect(@biker2.rides).to eq({@ride2 => [65.0]})
      expect(@biker2.total_rides).to eq(1)
      expect(@bike_club1.most_rides).to eq(@biker)

      @biker2.log_ride(@ride2, 15.0)
      @biker2.log_ride(@ride2, 35.0)
      @biker2.log_ride(@ride2, 60.0)
      @biker2.log_ride(@ride2, 90.0)
      expect(@biker2.total_rides).to eq(5)
      expect(@biker2.rides).to eq({@ride2 => [65.0, 15.0, 35.0, 60.0, 90.0]})
      expect(@bike_club1.most_rides).to eq(@biker2)
    end
  end

  describe "#best time" do
    it "returns the biker object with the best time for ride" do
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
      # @biker2.log_ride(@ride1, 95.0)
      @biker2.log_ride(@ride2, 45.0)
      
      expect(@bike_club1.best_time(@ride1)).to eq(@biker)
      expect(@bike_club1.best_time(@ride2)).to eq(@biker2)
      
      # biker3 = Biker.new("Tony", 50)
      # @bike_club1.add_biker(biker3)
      # biker3.learn_terrain!(:gravel)
      # biker3.learn_terrain!(:hills)
      # biker3.log_ride(@ride1, 92.6)
      # expect(@bike_club1.best_time(@ride1)).to eq(biker3)
    end
  end

  describe "#bikers eligible" do
    it "returns array of eligible biker objects" do
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
      @biker2.log_ride(@ride2, 65.0)
      @biker2.log_ride(@ride1, 65.0) #not elgible - distance too long

      expect(@bike_club1.bikers_eligible(@ride1)).to eq([@biker])
      expect(@bike_club1.bikers_eligible(@ride2)).to eq([@biker, @biker2])
    end
  end
end