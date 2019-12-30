class Map
  attr_reader :array

  def initialize
    @array = []
  end
  
  def set(key, value)
    # Checks to see if the key exists as a key of the map
    pair_index = self.array.index { |pair| pair[0] == key }

    # If it does it assigns the value to that key
    if pair_index
      self.array[pair_index][1] = value
    else
      # Otherwise it will make a new key value pair and push it to the end of the array
      self.array.push([key, value])
    end

    value
  end

  def get(key)
    
  end

  def delete(key)

  end

  def show
    deep_dup(self.array)
  end

  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end

end