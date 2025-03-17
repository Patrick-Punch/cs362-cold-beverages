require_relative '../lib/water_dispenser'

describe 'A water dispenser' do
  let(:reservoir) { double('Reservoir') }  # Mocked Reservoir
  let(:vessel) { double('Vessel', volume: 100) }  # Mocked Vessel
  before do
    @dispenser = WaterDispenser.new(reservoir)
  end

  it 'is initialized with a reservoir' do
    expect(@dispenser.reservoir).to eq(reservoir)
  end

  it 'dispenses the correct volume of water' do
    expect(reservoir).to receive(:drain).with(100)
    @dispenser.dispense(vessel)
  end

  it 'does not drain water when the vessel has no volume' do
    vessel = double('Vessel', volume: 0)
    expect(reservoir).to receive(:drain).with(0)
    @dispenser.dispense(vessel)
  end

  it 'raises an error when the reservoir does not have enough water' do
    allow(reservoir).to receive(:drain).with(100).and_raise('Not enough water')
    expect { @dispenser.dispense(vessel) }.to raise_error('Not enough water')
  end
end
