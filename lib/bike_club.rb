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
    #iterate throught all the bikers, and see who has the most loged rides (greater number of rides in hash)
    # @bikers.each do |biker|, biker.rides.count or biker.rides.max?
    
    @bikers.max_by do |biker, total|
      biker.total_rides
    end
  end
end