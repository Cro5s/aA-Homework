class Stack
  attr_reader :array

  def initialize
    @array = []
  end

  def push(el)
    array.push(el)
  end

  def pop
    array.pop(el)
  end

  def peek
    array.last
  end

end