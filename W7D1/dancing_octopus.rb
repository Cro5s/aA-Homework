tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(target_dir, tiles_array)
  tiles_array.each_with_index { |dir, tenticle_num| return tenticle_num if dir == target_dir }
end

p slow_dance("up", tiles_array) # -> 0
p slow_dance("right-down", tiles_array) # -> 3
puts

tiles_hash = { "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7 }

def fast_dance(target_dir, tiles_hash)
  tiles_hash[target_dir]
end

p fast_dance("right-down", tiles_hash) # -> 0
p fast_dance("up", tiles_hash) # -> 3