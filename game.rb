class Game
  attr_reader :player1, :player2
  attr_accessor :current_player, :num1, :num2, :io_logic

  def initialize(player1, player2, io_logic)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
    @io_logic = io_logic
  end

  def start
    self.io_logic.display_message("----- Welcome to the Math Game! -----")

    until game_over do
      self.io_logic.display_message("#{self.current_player.name}'s turn")
      generate_question

      if self.io_logic.answer == correct_answer
        self.io_logic.display_message("YES! You are correct!")
      else
        self.io_logic.display_message("#{self.current_player.name}: Seriously? No!")
        self.current_player.reduce_life
      end
     
      self.io_logic.display_message("#{self.player1.name}: #{self.player1.lives}/3 vs #{self.player2.name}: #{self.player2.lives}/3")
      self.io_logic.display_message("----- NEW TURN -----")
      change_player
    end

    self.io_logic.display_message("#{self.current_player.name} wins with a score of #{self.current_player.lives}/3")
    self.game_end_message
  end
  
  def change_player
    self.current_player = self.current_player == self.player1 ? self.player2 : self.player1
  end

  def generate_question
    self.num1 = rand(1..20)
    self.num2 = rand(1..20)
    self.io_logic.display_message("#{self.current_player.name}: What does #{self.num1} plus #{self.num2} equal?")
  end

  def correct_answer
    self.num1 + self.num2
  end

  def game_over
    self.player1.lives <= 0 || self.player2.lives <= 0
  end

end
