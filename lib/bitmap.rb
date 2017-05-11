class Bitmap
  MAX_WIDTH = 250
  MAX_HEIGHT = 250

  attr_reader :m, :n

  def initialize(m, n)
    raise "M must be in the range 1 to #{MAX_WIDTH}" if m < 1 || m > MAX_WIDTH
    raise "N must be in the range 1 to #{MAX_HEIGHT}" if n < 1 || n > MAX_HEIGHT

    @m = m
    @n = n
  end
end
