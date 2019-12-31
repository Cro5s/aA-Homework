class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player_1 = name1
    @player_2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
    
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    self.cups.each_with_index do |cup, i|
      next if i == 6 || i == 13
      4.times { cup << :stone }
    end

  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 13
    raise "Starting cup is empty" if self.cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    # Grab stones at cup index / empty cup at index
    stones = self.cups[start_pos]
    self.cups[start_pos] = []
    
    # Keep track of current cup
    cup_index = start_pos

    # Place a stone in each cup excluding opposing player's store cup
    # Keep going until done
    until stones.empty?
      # Reset the index of cup to 0 when it is greater than 13
      cup_index += 1
      cup_index = 0 if cup_index > 13
      
      if cup_index == 6 
        self.cups[cup_index] << stones.pop if current_player_name == @player_1
      elsif cup_index == 13 
        self.cups[cup_index] << stones.pop if current_player_name == @player_2
      else
        self.cups[cup_index] << stones.pop
      end
    end

    self.render
    next_turn(cup_index)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13 
      return :prompt
    elsif self.cups[ending_cup_idx].length == 1
      return :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).all? { |index| return true if self.cups[index].empty? }
    (7..12).all? { |index| return true if self.cups[index].empty? }
    false
  end

  def winner
    case self.cups[6].count <=> self.cups[13].count
    when 0
      return :draw
    when -1
      return @player_2
    else
      return @player_1
    end
  end
end
