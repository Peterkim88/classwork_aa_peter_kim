class SmartStack < Stack

  attr_reader :max_size

  def initialize(n)
    @max_size = n
    @underlying_array = []
  end

  def full?
    @underlying_array.length >= @max_size
  end

  def push(*args)
    raise "stack is full" if args.length + @underlying_array.length > @max_size
    args.each do |arg| 
      @underlying_array << arg
    end
    @underlying_array.length
  end

  def pop(n = 1)
    popped = []
    n.times { popped << @underlying_array.pop}
    popped
  end

  private

  attr_writer :max_size
  attr_accessor :underlying_array
  
end