require_relative '../lib/bitmap'

RSpec.describe Bitmap do
  subject { described_class.new(4, 2) }
  let(:initial_bitmap) { [%w(O O O O), %w(O O O O)] }

  describe 'initialization' do
    it 'returns a new 2 dimensional array of the specified size' do
      subject = described_class.new(4, 2)
      expect(subject.render).to eq initial_bitmap
    end

    it 'errors when width is too small' do
      expect{ described_class.new(0, 1) }.to raise_error(
        "M must be in the range 1 to #{Bitmap::MAX_WIDTH}"
      )
    end

    it 'errors when height is too small' do
      expect{ described_class.new(1, 0) }.to raise_error(
        "N must be in the range 1 to #{Bitmap::MAX_HEIGHT}"
      )
    end

    it 'errors when M is too large' do
      expect{ described_class.new(Bitmap::MAX_WIDTH + 1, 1) }.to raise_error(
        "M must be in the range 1 to #{Bitmap::MAX_WIDTH}"
      )
    end

    it 'errors when N is too large' do
      expect{ described_class.new(1, Bitmap::MAX_HEIGHT + 1) }.to raise_error(
        "N must be in the range 1 to #{Bitmap::MAX_HEIGHT}"
      )
    end
  end

  describe 'apply' do
    it 'colours a pixel' do
      subject.apply(4, 1, 'A')
      expect(subject.render).to eq [%w(O O O A), %w(O O O O)]
    end

    it 'clears the bitmap' do
      subject.apply(4, 1, 'A')
      subject.clear

      expect(subject.render).to eq initial_bitmap
    end

    it 'errors when C is not a letter' do
      expect{ subject.apply(1, 1, '1') }.to raise_error(
        'C must be in the range A to Z'
      )
      expect{ subject.apply(1, 1, 'a') }.to raise_error(
        'C must be in the range A to Z'
      )
    end

    it 'errors when X is less than 1' do
      expect{ subject.apply(0, 1, nil) }.to raise_error(
        'X must be in the range 1 to 4'
      )
    end

    it 'errors when Y is less than 1' do
      expect{ subject.apply(1, 0, nil) }.to raise_error(
        'Y must be in the range 1 to 2'
      )
    end

    it 'errors when X is greater than width' do
      expect{ subject.apply(5, 1, nil) }.to raise_error(
        'X must be in the range 1 to 4'
      )
    end

    it 'errors when Y is greater than height' do
      expect{ subject.apply(1, 3, nil) }.to raise_error(
        'Y must be in the range 1 to 2'
      )
    end
  end
end
