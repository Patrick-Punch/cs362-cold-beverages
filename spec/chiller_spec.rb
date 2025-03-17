require_relative '../lib/chiller'

describe 'A chiller' do
  let(:chiller) { Chiller.new(150) }
  let(:item) { double('Item', volume: 30) }

  it 'has a default temperature of 70' do
    expect(chiller.temperature).to eq(70)
  end

  it 'has an initial capacity' do
    expect(chiller.capacity).to eq(150)
  end

  it 'is initially off' do
    expect(chiller.instance_variable_get(:@power)).to eq(:off)
  end

  it 'turns on' do
    chiller.turn_on
    expect(chiller.instance_variable_get(:@power)).to eq(:on)
  end

  it 'turns off' do
    chiller.turn_on
    chiller.turn_off
    expect(chiller.instance_variable_get(:@power)).to eq(:off)
  end

  it 'can store items' do
    chiller.add(item)
    expect(chiller.instance_variable_get(:@contents)).to include(item)
  end

  it 'calculates remaining capacity' do
    chiller.add(item)
    expect(chiller.remaining_capacity).to eq(120)
  end

  it 'returns full capacity when empty' do
    expect(chiller.remaining_capacity).to eq(150)
  end

  it 'returns 0 capacity when full' do
    5.times{chiller.add(item)}
    expect(chiller.remaining_capacity).to eq(0)
  end

  it 'reduces temperature when set_level is called' do
    chiller.set_level(6) # Each level reduces temp by 5 degrees
    expect(chiller.temperature).to eq(40)
  end

  it 'does not change temperature at level 0' do
    chiller.set_level(0)
    expect(chiller.temperature).to eq(70)
  end
end