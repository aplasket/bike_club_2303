class BikeClub
  attr_reader :name,
              :bikers

  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
  end

  def most_rides
    #psuedocode:
    #iterate throught all the bikers, and see who has the most total_rides 
    # @bikers.each ... or bikers.max_by, find biker.total_rides
    
    @bikers.max_by do |biker, total|
      biker.total_rides
    end
  end
end