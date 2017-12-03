module MediumMode

  def medium_game
    medium_start_instructions
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
        medium_cheat
      elsif @input == "p" || @input == "play"
        mode_select
      elsif @input == @medium_code
        medium_correct_answer
      elsif @input.length != 6
        puts medium_incorrect_guess_length
      else medium_incorrect_answer_response
      end
    end
  end

  def medium_cheat
    puts "The answer is #{@medium_code}, ya cheater. Enter it to end the game."
  end

  def medium_start_instructions
    puts "\nI have generated a sequence with six elements made up"\
    " of: (r)ed, (g)reen, (b)lue, (y)ellow and (o)range. Use (q)uit at any"\
    " time to end the game. What's your guess?"
  end

  def medium_incorrect_guess_length
    "The code is six digits long. Try again."
  end

  def medium_matches
    matches = 0
    if @input[0] == @medium_code[0]
      matches += 1
    end

    if @input[1] == @medium_code[1]
      matches += 1
    end

    if @input[2] == @medium_code[2]
      matches += 1
    end

    if @input[3] == @medium_code[3]
      matches += 1
    end
    
    if @input[4] == @medium_code[4]
      matches += 1
    end

    if @input[5] == @medium_code[5]
      matches += 1
    end
    matches
  end

  def medium_correct_element
    @medium_code.count(@input)
  end

  def medium_incorrect_answer_response
    medium_matches
    puts "Your guess '#{@input}' has #{medium_correct_element} correct"\
    " letter(s) in #{medium_matches} correct position(s)."\
    "\nYou have taken #{@guesses} total guess(es)."
  end

  def medium_correct_answer
    puts "Congration you done guessed #{@medium_code} in #{@guesses} guesses "\
    "over #{minutes} minutes and #{seconds} seconds!"
    @guesses = 0
    puts "\nWould you like to (p)lay again or (q)uit?"
  end
end
