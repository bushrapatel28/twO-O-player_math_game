class IO_LOGIC
  def display_message(message)
    puts message
  end

  def answer
    gets.chomp.to_i
  end

  def game_end_message
    puts "----- GAME OVER -----"
    puts "Good Bye!"
  end
end
