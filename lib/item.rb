class Item
  attr_reader :name, :volume

  def initialize(name, volume)
    raise ArgumentError, 'Volume must be > 0' if volume <= 0
    @name = name
    @volume = volume
  end

end
