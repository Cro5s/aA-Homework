fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(fishes)
  fishes.each_with_index do |fish_1, idx_1|  
    largest = true

    fishes.each_with_index do |fish_2, idx_2|
      if idx_2 > idx_1
        largest = false if fish_1.length < fish_2.length
      end
    end

    #returns fish_1 if largest remained true while fish_1 was compared to other fishes
    return fish_1 if largest
  end
  
end

# p sluggish_octopus(fishes) # -> "fiiiissshhhhhh"
# puts

def sluggish_octopus_2(fishes) 
  prc = Proc.new { |a, b| a <=> b }

  bubble_sort(&prc).first
end

class Array
  def bubble_sort(&prc)
    return self if self.length <= 1
    
    sorted = false
    
    while !sorted
      sorted = true
      
      (0...self.length).each do |i|
        if prc.call(self[i], self[i + 1]) == -1
          self[i], self[i + 1] = self[i + 1], self[i]
          sorted = false
        end
      end
    end
    
    self
  end
  
end

# p sluggish_octopus_2(fishes) # -> "fiiiissshhhhhh"
# puts

def dominant_octopus(fishes)
  prc = Proc.new { |a, b| a <=> b }

  fishes.merge_sort(prc).first
end

class Array
  
  def merge_sort(&prc)
    return self if self.length <= 1
    
    half = self.length / 2
    
    sorted_left = self.take(half).dominant_octopus(&prc)
    sorted_right = self.drop(half).dominant_octopus(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end
  
  def merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when (-1..0)
        merged << left.shift
      else
        merged << right.shift
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
  
end

# p dominant_octopus(fishes) # -> "fiiiissshhhhhh"
# puts

def clever_octopus(fishes)
  largest = fishes.first

  fishes.each { |fish| largest = fish if largest.length < fish.length }

  largest
end

# p clever_octopus(fishes) # -> "fiiiissshhhhhh"