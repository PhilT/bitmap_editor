require_relative '../lib/bitmap_editor'

RSpec.describe BitmapEditor do
  let(:kernel) { double puts: nil }

  context 'when valid input' do
    it 'outputs expected bitmap given valid input' do
      subject.run File.join(__dir__, '../examples/input.txt'), kernel

      expect(kernel).to have_received(:puts).with(
        <<~OUTPUT
        OOOOO
        OOZZZ
        AWOOO
        OWOOO
        OWOOO
        OWOOO
        OUTPUT
        .strip
      )
    end
  end

  context 'when no file' do
    it 'returns instruction' do
      subject.run 'bla.txt', kernel
      expect(kernel).to have_received(:puts).with 'please provide correct file'
    end
  end

  context 'when no instructions' do
    it 'returns error message' do
      subject.run File.join(__dir__, '../examples/show.txt'), kernel
      expect(kernel).to have_received(:puts).with 'There is no image'
    end
  end

  context 'when any other command' do
    it 'returns error message' do
      subject.run File.join(__dir__, '../examples/single.txt'), kernel
      expect(kernel).to have_received(:puts).with 'unrecognised command :('
    end
  end
end
