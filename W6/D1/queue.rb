class Queue
  attr_reader :array

  def initialize
    @array = []
  end

  def enqueue(el)
    self.array.push(el)
  end

  def dequeue
    self.array.shift
  end

  def peek
    self.array.first
  end

end