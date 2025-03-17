class Vessel
  attr_reader :name, :volume
  attr_accessor :contents


  def initialize(name = 'FAKE', volume = 100)
    @name = name
    @volume = volume
    @contents = 0
  end

  def empty? 
    @contents == 0
  end


  def fill(amount = volume)
    @contents = [contents + amount, volume].min
  end
end
