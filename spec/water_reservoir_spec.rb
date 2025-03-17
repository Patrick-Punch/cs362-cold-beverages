require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
  let(:reservoir) { WaterReservoir.new(10, 5) }  # Default reservoir with 10 capacity, 5 initial volume

  it 'is initialized with a capacity and initial water volume' do
    expect(reservoir.capacity).to eq(10)
    expect(reservoir.current_water_volume).to eq(5)
  end

  it 'is empty when it contains no water' do
    empty_reservoir = WaterReservoir.new(10, 0)
    expect(empty_reservoir).to be_empty
  end

  it 'is not empty when it contains water' do
    expect(reservoir).not_to be_empty
  end

  it 'fills to full capacity' do
    reservoir.fill
    expect(reservoir.current_water_volume).to eq(reservoir.capacity)
  end

  it 'drains the correct amount of water' do
    reservoir.drain(3)
    expect(reservoir.current_water_volume).to eq(2)
  end

  it 'does not drain below zero' do
    reservoir.drain(10)
    expect(reservoir.current_water_volume).to eq(0)  # Should stop at 0
  end
end