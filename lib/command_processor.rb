require_relative 'bitmap'

class CommandProcessor
  COMMANDS = {
    'I' => 'create',
    'C' => 'clear',
    'L' => 'apply',
    'V' => 'vertical',
    'H' => 'horizontal',
    'S' => 'show'
  }.freeze

  def initialize(bitmap)
    @bitmap = bitmap
  end

  def call(params)
    args = params.split(' ')
    method = COMMANDS[args.shift]
    raise 'unrecognised command :(' unless method
    @bitmap.send(method, *args)
  end
end
