require_relative 'bitmap'
require_relative 'command_processor'

class BitmapEditor
  def initialize
    @bitmap = Bitmap.new
    @processor = CommandProcessor.new(@bitmap)
  end

  def run(file, kernel = Kernel)
    raise "please provide correct file" unless file && File.exist?(file)

    File.open(file).each do |line|
      output = @processor.call(line.chomp)
      kernel.puts output if output
    end
  rescue => e
    kernel.puts e.message
  end
end
