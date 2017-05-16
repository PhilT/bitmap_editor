class Bitmap
  MAX_WIDTH = 250
  MAX_HEIGHT = 250
  WHITE = 'O'


  def create(m, n = nil)
    if n.nil?
      @matrix = m.split("\n").map { |x| x.split('') }
      @m = @matrix.first.length
      @n = @matrix.length
    else
      @m = m.to_i
      @n = n.to_i
    end

    raise "M must be in the range 1 to #{MAX_WIDTH}" if @m < 1 || @m > MAX_WIDTH
    raise "N must be in the range 1 to #{MAX_HEIGHT}" if @n < 1 || @n > MAX_HEIGHT

    clear unless defined?(@matrix)
    nil
  end

  def clear
    @matrix = Array.new(@n) { Array.new(@m, WHITE) }
    nil
  end

  def apply(x, y, colour)
    validate
    x = x.to_i
    y = y.to_i
    raise "X must be in the range 1 to #{@m}" if x < 1 || x > @m
    raise "Y must be in the range 1 to #{@n}" if y < 1 || y > @n
    raise "C must be in the range A to Z" unless ('A'..'Z').include? colour

    set(x, y, colour)
    nil
  end

  def vertical(x, y1, y2, colour)
    x = x.to_i
    y1 = y1.to_i
    y2 = y2.to_i

    (y1..y2).each do |y|
      apply(x, y, colour)
    end
    nil
  end

  def horizontal(x1, x2, y, colour)
    x1 = x1.to_i
    x2 = x2.to_i
    y = y.to_i

    (x1..x2).each do |x|
      apply(x, y, colour)
    end
    nil
  end

  def fill(x, y, colour, current_colour = nil)
    current_colour ||= get(x, y)

    return if x < 1 || x > @m || y < 1 || y > @n
    return if get(x, y) != current_colour

    set(x, y, colour)

    fill(x + 1, y, colour, current_colour)
    fill(x - 1, y, colour, current_colour)
    fill(x, y + 1, colour, current_colour)
    fill(x, y - 1, colour, current_colour)
    nil
  end

  def show
    validate
    @matrix.map{|n| n.join('') }.join("\n")
  end

  private

  def set(x, y, colour)
    @matrix[y - 1][x - 1] = colour
  end

  def get(x, y)
    @matrix[y - 1][x - 1]
  end

  def validate
    raise 'There is no image' unless defined?(@matrix)
  end
end
