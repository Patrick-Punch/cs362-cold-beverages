require_relative '../lib/item'

describe 'An item of food or a beverage' do
  it 'has a name and volume' do
    item = Item.new('Soda', 500)
    expect(item.name).to eq('Soda')
    expect(item.volume).to eq(500)
  end

  it 'is not equal to another item with different name or volume' do
    item1 = Item.new('Soda', 500)
    item2 = Item.new('Noodles', 1300)
    expect(item1).not_to eq(item2)
  end

  it 'raises an error if volume is negative or zero' do
    expect { Item.new('Soda', -100) }.to raise_error(ArgumentError)
    expect { Item.new('Water', 0) }.to raise_error(ArgumentError)
  end
end
