class Stack
  def initialize
    @stack = []
  end

  def push(el)
    @stack.push(el)
  end

  def pop
    @stack.pop(el)
  end

  def peek
    return @stack.last
  end

end