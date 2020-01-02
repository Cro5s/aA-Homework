class Simon
  COLORS = %w(red blue green yellow)
  
  attr_accessor :sequence_length, :game_over, :seq
  
  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
  
  def add_random_color
    self.seq << COLORS.sample
  end

  def play
    until self.game_over
      self.take_turn
      system("clear")
    end

    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence

    unless self.game_over
      self.round_success_message
      self.sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color

    self.seq.each do |color|
      puts color
      sleep 0.75
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    puts "Please input the sequence of colors using the first letter of the color and a new line in between each color."

    self.seq.each do |color|
      user_input = gets.chomp

      if color[0] != user_input && color != user_input
        self.game_over = true
        break
      end
    end

    sleep 0.25
  end

  def round_success_message
    puts "Nice Job! The next sequence is:"
    sleep 1.5
  end

  def game_over_message
    puts "Game over! Round results #{self.sequence_length - 1}"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end

