module HardMode

  def hard_game
    hard_start_instructions
    @start_time = Time.now
    loop do
      prompt = "> "
      print prompt
      @input = gets.chomp.downcase
      @guesses += 1
      break if @input == "q" || @input == "quit"
      if @input ==  "i" || @input == "instructions"
        instructions
      elsif @input ==  "c" || @input == "cheat"
        hard_cheat
      elsif @input == "p" || @input == "play"
        mode_select
      elsif @input == @hard_code
        hard_correct_answer
      elsif @input.length != 8
        puts hard_incorrect_guess_length
      else hard_incorrect_answer_response
      end
    end
  end

  def hard_cheat
    puts "The answer is #{@hard_code}, ya cheater. Enter it to end the game."
  end

  def hard_start_instructions
    puts "\nI have generated a sequence with eight elements made up"\
    " of: (r)ed, (g)reen, (b)lue, (y)ellow, (o)range and (p)urple. Use"\
    " (q)uit at any time to end the game. What's your guess?"
  end

  def hard_incorrect_guess_length
    "The code is eight digits long. Try again."
  end

  def hard_matches
    matches = 0
    if @input[0] == @hard_code[0]
      matches += 1
    end

    if @input[1] == @hard_code[1]
      matches += 1
    end

    if @input[2] == @hard_code[2]
      matches += 1
    end

    if @input[3] == @hard_code[3]
      matches += 1
    end

    if @input[4] == @hard_code[4]
      matches += 1
    end

    if @input[5] == @hard_code[5]
      matches += 1
    end

    if @input[6] == @hard_code[6]
      matches += 1
    end

    if @input[7] == @hard_code[7]
      matches += 1
    end
    matches
  end

  def hard_correct_element
    @hard_code.count(@input)
  end

  def hard_incorrect_answer_response
    hard_matches
    puts "Your guess '#{@input}' has #{hard_correct_element} correct"\
    " letter(s) in #{hard_matches} correct position(s)."\
    "\nYou have taken #{@guesses} total guess(es)."
  end

  def hard_correct_answer
    puts "Congration you done guessed #{@hard_code} in #{@guesses} guesses "\
    "over #{minutes} minutes and #{seconds} seconds!"
    @guesses = 0
    puts "\nWould you like to (p)lay again or (q)uit?"
  end
end
