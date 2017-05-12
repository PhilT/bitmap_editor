require_relative '../lib/bitmap'

RSpec.describe Bitmap do
  let(:initial_bitmap) { "OOOO\nOOOO" }

  describe 'create' do
    it 'returns a new 2 dimensional array of the specified size' do
      subject.create('4', '2')
      expect(subject.show).to eq initial_bitmap
    end

    it 'errors when width is too small' do
      expect{ subject.create('0', '1') }.to raise_error(
        "M must be in the range 1 to #{Bitmap::MAX_WIDTH}"
      )
    end

    it 'errors when height is too small' do
      expect{ subject.create('1', '0') }.to raise_error(
        "N must be in the range 1 to #{Bitmap::MAX_HEIGHT}"
      )
    end

    it 'errors when M is too large' do
      expect{ subject.create(Bitmap::MAX_WIDTH + 1, '1') }.to raise_error(
        "M must be in the range 1 to #{Bitmap::MAX_WIDTH}"
      )
    end

    it 'errors when N is too large' do
      expect{ subject.create('1', Bitmap::MAX_HEIGHT + 1) }.to raise_error(
        "N must be in the range 1 to #{Bitmap::MAX_HEIGHT}"
      )
    end

    it 'returns nil' do
      expect(subject.create('4', '2')).to be nil
    end
  end

  describe 'clear' do
    before { subject.create('4', '2') }

    it 'clears the bitmap' do
      subject.apply('4', '1', 'A')
      subject.clear

      expect(subject.show).to eq initial_bitmap
    end

    it 'returns nil' do
      expect(subject.clear).to be nil
    end
  end

  describe 'apply' do
    before { subject.create('4', '2') }

    it 'colours a pixel' do
      subject.apply('4', '1', 'A')
      expect(subject.show).to eq "OOOA\nOOOO"
    end

    it 'returns nil' do
      expect(subject.apply('4', '1', 'A')).to be nil
    end

    it 'errors when C is not a letter' do
      expect{ subject.apply('1', '1', '1') }.to raise_error(
        'C must be in the range A to Z'
      )
      expect{ subject.apply('1', '1', 'a') }.to raise_error(
        'C must be in the range A to Z'
      )
    end

    it 'errors when X is less than 1' do
      expect{ subject.apply('0', '1', nil) }.to raise_error(
        'X must be in the range 1 to 4'
      )
    end

    it 'errors when Y is less than 1' do
      expect{ subject.apply('1', '0', nil) }.to raise_error(
        'Y must be in the range 1 to 2'
      )
    end

    it 'errors when X is greater than width' do
      expect{ subject.apply('5', '1', nil) }.to raise_error(
        'X must be in the range 1 to 4'
      )
    end

    it 'errors when Y is greater than height' do
      expect{ subject.apply('1', '3', nil) }.to raise_error(
        'Y must be in the range 1 to 2'
      )
    end
  end

  describe 'vertical' do
    before { subject.create('4', '2') }

    it 'colours a vertical line' do
      subject.vertical('1', '1', '2', 'A')
      expect(subject.show).to eq "AOOO\nAOOO"
    end

    it 'returns nil' do
      expect(subject.vertical('1', '1', '2', 'A')).to be nil
    end

    it 'errors when coordinate is out of range' do
      expect{ subject.vertical('0', '1', '2', nil) }.to raise_error(
        'X must be in the range 1 to 4'
      )
    end
  end

  describe 'horizontal' do
    before { subject.create('4', '2') }

    it 'colours a horizontal line' do
      subject.horizontal('1', '3', '2', 'A')
      expect(subject.show).to eq "OOOO\nAAAO"
    end

    it 'errors when coordinate is out of range' do
      expect{ subject.horizontal('0', '1', '2', nil) }.to raise_error(
        'X must be in the range 1 to 4'
      )
    end
  end

  describe 'show' do
    before { subject.create('4', '2') }

    it 'returns the visual representation of the bitmap' do
      expect(subject.show).to eq "OOOO\nOOOO"
    end

    it 'errors when not created' do
      expect{ described_class.new.show }.to raise_error('There is no image')
    end
  end
end
