class WaterReservoir

  attr_reader :capacity
  attr_accessor :current_water_volume

  def initialize(capacity = 10, initial_water_volume = 0)
    @capacity = capacity
    @current_water_volume = initial_water_volume
  end

  def empty?
    current_water_volume == 0
  end

  def fill
    self.current_water_volume = capacity
  end

  def drain(volume)
    # set current volume to 0 if draining more than current volume
    self.current_water_volume = [current_water_volume - volume, 0].max
  end

end
