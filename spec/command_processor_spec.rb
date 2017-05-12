require_relative '../lib/command_processor'

RSpec.describe CommandProcessor do
  let(:bitmap) do
    instance_double 'Bitmap',
      create: nil,
      clear: nil,
      apply: nil,
      vertical: nil,
      horizontal: nil,
      show: nil
  end
  subject { described_class.new(bitmap) }

  context 'when unknown command' do
    it 'errors' do
      expect{ subject.call('') }.to raise_error 'unrecognised command :('
    end
  end

  describe 'I M N' do
    it 'calls create' do
      subject.call('I 1 2')
      expect(bitmap).to have_received(:create).with '1', '2'
    end
  end

  describe 'C' do
    it 'calls clear' do
      subject.call('C')
      expect(bitmap).to have_received(:clear).with no_args
    end
  end

  describe 'L X Y C' do
    it 'calls apply' do
      subject.call('L 1 2 A')
      expect(bitmap).to have_received(:apply).with '1', '2', 'A'
    end
  end

  describe 'V X Y1 Y2 C' do
    it 'calls vertical' do
      subject.call('V 1 2 3 A')
      expect(bitmap).to have_received(:vertical).with '1', '2', '3', 'A'
    end
  end

  describe 'H X1 X2 Y C' do
    it 'calls horizontal' do
      subject.call('H 1 2 3 A')
      expect(bitmap).to have_received(:horizontal).with '1', '2', '3', 'A'
    end
  end

  describe 'S' do
    it 'calls show' do
      subject.call('S')
      expect(bitmap).to have_received(:show)
    end
  end
end
