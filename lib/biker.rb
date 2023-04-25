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
    ##psuedocode:
    # ?? return false /nil if not acceptable terrain || rides.total_distance < @max_distance
    # if @acceptable_terrain.include?(ride.terrain) && !@rides.keys.include?(ride) && @maxdistance, rides[ride] = [time]
    #else  @acceptable_terrain.include?(ride) && @rides.keys.include?(ride), rides[ride] << time

    if @acceptable_terrain.include?(ride.terrain) && @rides.keys.include?(ride) && ride.total_distance < @max_distance 
      @rides[ride] << time
    elsif @acceptable_terrain.include?(ride.terrain) && !@rides.keys.include?(ride) && ride.total_distance < @max_distance 
      @rides[ride] = [time]
    end
  end


    def personal_record(ride)

      #psuedocode:
      #return false, if @rides[ride].nil? 
      # @rides[ride] min by or min ...
      return false if @rides[ride].nil?
      @rides[ride].min
    end

  def total_rides
    total = 0

    @rides.each do |ride, times|
      total += rides[ride].count
    end

    total
  end
end