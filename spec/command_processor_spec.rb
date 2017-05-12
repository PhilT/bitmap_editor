require_relative '../lib/command_processor'

RSpec.describe CommandProcessor do
  let(:bitmap) { instance_double 'Bitmap', show: nil }
  subject { described_class.new(bitmap) }

  context 'when unknown command' do
    it 'errors' do
      expect{ subject.call('') }.to raise_error 'unrecognised command :('
    end
  end

  describe 'S' do
    it 'calls show' do
      subject.call('S')
      expect(bitmap).to have_received(:show)
    end
  end
end
