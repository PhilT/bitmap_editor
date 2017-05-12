class Bitmap
  MAX_WIDTH = 250
  MAX_HEIGHT = 250
  WHITE = 'O'

  def create(m, n)
    raise "M must be in the range 1 to #{MAX_WIDTH}" if m < 1 || m > MAX_WIDTH
    raise "N must be in the range 1 to #{MAX_HEIGHT}" if n < 1 || n > MAX_HEIGHT

    @m = m
    @n = n
    clear
    self
  end

  def show
    validate
    @matrix.freeze.clone
  end

  def clear
    @matrix = Array.new(@n) { Array.new(@m, WHITE) }
  end

  def apply(x, y, colour)
    validate
    raise "X must be in the range 1 to #{@m}" if x < 1 || x > @m
    raise "Y must be in the range 1 to #{@n}" if y < 1 || y > @n
    raise "C must be in the range A to Z" unless ('A'..'Z').include? colour

    @matrix[y - 1][x - 1] = colour
  end

  def vertical(x, y1, y2, colour)

  end

  def horizontal(x1, x2, y, colour)

  end

  private

  def validate
    raise 'There is no image' unless defined?(@matrix)
  end
end
