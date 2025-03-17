require_relative '../lib/refrigerator'

describe 'A refrigerator' do
  let(:chiller) { double('Chiller', capacity: 50, remaining_capacity: 50, add: nil, turn_on: nil, turn_off: nil, set_level: nil, temperature: 40) }
  let(:freezer) { double('Freezer', capacity: 50, remaining_capacity: 50, add: nil, turn_on: nil, turn_off: nil, set_level: nil, temperature: 0) }
  let(:water_reservoir) { double('WaterReservoir', current_water_volume: 100) }
  let(:water_dispenser) { double('WaterDispenser') }
  let(:refrigerator) { Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir) }
  let(:item) { double('Item') }

  it 'has a chiller, freezer, water dispenser, and water reservoir' do
    expect(refrigerator.chiller).to eq(chiller)
    expect(refrigerator.freezer).to eq(freezer)
    expect(refrigerator.water_dispenser).to eq(water_dispenser)
    expect(refrigerator.water_reservoir).to eq(water_reservoir)
  end

  it 'adds items to the chiller' do
    expect(chiller).to receive(:add).with(item)
    refrigerator.chill(item)
  end

  it 'adds items to the freezer' do
    expect(freezer).to receive(:add).with(item)
    refrigerator.freeze(item)
  end

  it 'calculates total capacity' do
    expect(refrigerator.total_capacity).to eq(100)
  end

  it 'calculates remaining capacity' do
    expect(refrigerator.remaining_capacity).to eq(100)
  end

  it 'turns on chiller and freezer' do
    expect(chiller).to receive(:turn_on)
    expect(freezer).to receive(:turn_on)
    refrigerator.plug_in
  end

  it 'turns off chiller and freezer' do
    expect(chiller).to receive(:turn_off)
    expect(freezer).to receive(:turn_off)
    refrigerator.unplug
  end

  it 'sets chiller temperature level' do
    expect(chiller).to receive(:set_level).with(3)
    refrigerator.set_chiller_level(3)
  end

  it 'sets freezer temperature level' do
    expect(freezer).to receive(:set_level).with(2)
    refrigerator.set_freezer_level(2)
  end

  it 'displays status correctly' do
    expected_status = <<~STATUS
      Power: off
      Storage: 100 of 100 available
      Temps: Chiller is 40, Freezer is 0
      Water: Reservoir has 100 remaining.
    STATUS

    expect(refrigerator.to_s).to eq(expected_status)
  end
end