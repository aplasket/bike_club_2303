class Biker
  attr_reader :name,
              :max_distance,
              :rides,
              :acceptable_terrain

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
  end

  def learn_terrain!(terrain_type)
    @acceptable_terrain << terrain_type
  end

  def log_ride(ride, time)
    #The Biker can keep track of all of its previous rides and times for those rides.
    #A Biker will not log a ride if the ride's terrain does not match their acceptable terrain. 
    # They also won't log a ride if the ride's total distance is greater 
    # than the Biker's max distance.
    #IF acceptable terrain && less than max distance, keeps track of all rides and times for those rides.
    
    ##psuedocode:
    # return false /nil if not acceptable terrain || rides.total_distance < @max_distance
    # if @acceptable_terrain.include?(ride.terrain) && !@rides.keys.include?(ride) && @maxdistance, rides[ride] = [time]
    #else  @acceptable_terrain.include?(ride) && @rides.keys.include?(ride), rides[ride] << time

    if @acceptable_terrain.include?(ride.terrain) && @rides.keys.include?(ride) && ride.total_distance < @max_distance 
      @rides[ride] << time
    elsif @acceptable_terrain.include?(ride.terrain) && !@rides.keys.include?(ride) && ride.total_distance < @max_distance 
      @rides[ride] = [time]
    end

  end
end