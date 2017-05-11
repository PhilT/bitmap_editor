class BitmapEditor
  def run(file, kernel = Kernel)
    return kernel.puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      case line
      when 'S'
        kernel.puts "There is no image"
      else
        kernel.puts 'unrecognised command :('
      end
    end
  end
end
