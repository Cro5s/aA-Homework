class Map
  attr_reader :hash_map

  def initialize
    @hash_map = []
  end
  
  def set(key, value)
    key_index = self.hash_map.index { |pair| pair[0] == key }
    if key_index
      self.hash_map[key_index][1] = value
    else
      self.hash_map.push([key, value])
    end

    value
  end
  
  def get(key)
    self.hash_map.each { |pair| return pair[1] if pair[0] == key }
    nil
  end
  
  def delete(key)
    value = get(key)
    self.hash_map.reject! { |pair| pair[0] == key}

    value
  end
  
  def show
    self.hash_map
  end

  # def deep_dup(arr)
  #   arr.hash_map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  # end

end