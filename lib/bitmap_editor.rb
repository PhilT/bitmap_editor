require_relative 'bitmap'
require_relative 'command_processor'

class BitmapEditor
  def initialize
    @bitmap = Bitmap.new
    @processor = CommandProcessor.new(@bitmap)
  end

  def run(file, kernel = Kernel)
    return kernel.puts "Please provide correct file" unless file && File.exist?(file)

    output = nil
    File.open(file).each do |line|
      output = @processor.call(line.chomp)
      break if output.is_a? String
    end
    kernel.puts output || 'Show never called'
  end
end
