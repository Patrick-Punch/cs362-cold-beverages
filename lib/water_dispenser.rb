class WaterDispenser

  attr_reader :reservoir

  def initialize(reservoir)
    @reservoir = reservoir
  end

  def dispense(vessel)
    amount = vessel.volume
    reservoir.drain(amount)
    reservoir.fill(amount)
  end

end
