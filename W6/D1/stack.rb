  class Stack
    attr_reader :array

    def initialize
      @array = []
    end

    def push(el)
      # adds an element to the stack
      self.array.push(el)
    end

    def pop
      # removes one element from the stack
      self.array.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      self.array.last
    end
  end