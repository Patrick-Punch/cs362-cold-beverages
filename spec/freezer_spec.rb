require_relative '../lib/freezer'

describe 'A freezer' do
  let(:freezer) { Freezer.new(200) }
  let(:item) { double('Item', volume: 50) }

  it 'has a default temperature of 70' do
    expect(freezer.temperature).to eq(70)
  end

  it 'has an initial capacity' do
    expect(freezer.capacity).to eq(200)
  end

  it 'is initially off' do
    freezer = Freezer.new
    expect(freezer.instance_variable_get(:@power)).to eq(:off)
  end

  it 'turns on' do
    freezer.turn_on
    expect(freezer.instance_variable_get(:@power)).to eq(:on)
  end

  it 'turns off' do
    freezer.turn_on
    freezer.turn_off
    expect(freezer.instance_variable_get(:@power)).to eq(:off)
  end

  it 'can store items' do
    freezer.add(item)
    expect(freezer.instance_variable_get(:@contents)).to include(item)
  end

  it 'calculates remaining capacity' do
    freezer.add(item)
    expect(freezer.remaining_capacity).to eq(150)
  end

  it 'returns full capacity when empty' do
    expect(freezer.remaining_capacity).to eq(200)
  end

  it 'returns 0 capacity when full' do
    4.times{freezer.add(item)}
    expect(freezer.remaining_capacity).to eq(0)
  end

  it 'reduces temperature when set_level is called' do
    freezer.set_level(4) # Each level reduces temp by 10 degrees
    expect(freezer.temperature).to eq(30)
  end

  it 'does not change temperature at level 0' do
    freezer.set_level(0)
    expect(freezer.temperature).to eq(70)
  end
end