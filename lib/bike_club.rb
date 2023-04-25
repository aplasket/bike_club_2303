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
    
    @bikers.max_by {|biker, total| biker.total_rides} 
  end

  def best_time(ride) 
    @bikers.min_by {|biker| biker.personal_record(ride)}  
  end

  def bikers_eligible(ride)
    eligible_bikers = []
    @bikers.each do |biker|
      if biker.acceptable_terrain.include?(ride.terrain) && biker.max_distance >= ride.total_distance
        eligible_bikers << biker
      end
    end
    eligible_bikers
  end

end

#best time method:
# #return biker object with the best tie for a given ride
    #psuedocode: iterate through bikers, find biker.personal_record(ride)
    # biker_times = {}
    # @bikers.each do |biker| 
    #   biker_times[ride] = {person: biker, record: biker.personal_record(ride)}
    #   require 'pry'; binding.pry
    # end

    # biker_times[ride]
      # biker.personal_record(ride)
    # end