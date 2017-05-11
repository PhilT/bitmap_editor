class Bitmap
  MAX_WIDTH = 250
  MAX_HEIGHT = 250
  WHITE = 'O'

  def initialize(m, n)
    raise "M must be in the range 1 to #{MAX_WIDTH}" if m < 1 || m > MAX_WIDTH
    raise "N must be in the range 1 to #{MAX_HEIGHT}" if n < 1 || n > MAX_HEIGHT

    @m = m
    @n = n
    @matrix = Array.new(n) { Array.new(m, WHITE) }
  end

  def render
    @matrix.freeze.clone
  end
end
