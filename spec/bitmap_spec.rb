require_relative '../lib/bitmap'

RSpec.describe Bitmap do
  it 'returns a new 2 dimensional array of the specified size' do
    subject = described_class.new(4, 2)
    expect(subject.render).to eq [%w(O O O O), %w(O O O O)]
  end

  it 'returns error when width is too small' do
    expect{ described_class.new(0, 1) }.to raise_error "M must be in the range 1 to #{Bitmap::MAX_WIDTH}"
  end

  it 'returns error when height is too small' do
    expect{ described_class.new(1, 0) }.to raise_error "N must be in the range 1 to #{Bitmap::MAX_HEIGHT}"
  end

  it 'returns error when M is too large' do
    expect{ described_class.new(Bitmap::MAX_WIDTH + 1, 1) }.to raise_error "M must be in the range 1 to #{Bitmap::MAX_WIDTH}"
  end

  it 'returns error when N is too large' do
    expect{ described_class.new(1, Bitmap::MAX_HEIGHT + 1) }.to raise_error "N must be in the range 1 to #{Bitmap::MAX_HEIGHT}"
  end
end
