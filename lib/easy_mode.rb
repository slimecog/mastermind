module EasyMode

  def easy_game
    easy_start_instructions
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
        easy_cheat
      elsif @input == "p" || @input == "play"
        mode_select
      elsif @input == @easy_code
        easy_correct_answer
      elsif @input.length != 4
        puts easy_incorrect_guess_length
      else easy_incorrect_answer_response
      end
    end
  end

  def easy_cheat
    puts "The answer is #{@easy_code}, ya cheater. Enter it to end the game."
  end

  def easy_start_instructions
    puts "\nI have generated a sequence with four elements made up"\
    " of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to"\
    " end the game. What's your guess?"
  end

  def easy_incorrect_guess_length
    "The code is four digits long. Try again."
  end

  def easy_matches
    matches = 0
    if @input[0] == @easy_code[0]
      matches += 1
    end

    if @input[1] == @easy_code[1]
      matches += 1
    end

    if @input[2] == @easy_code[2]
      matches += 1
    end

    if @input[3] == @easy_code[3]
      matches += 1
    end
    matches
  end

  def easy_correct_element
    @easy_code.count(@input)
  end

  def easy_incorrect_answer_response
    easy_matches
    puts "Your guess '#{@input}' has #{easy_correct_element} correct"\
    " letter(s) in #{easy_matches} correct position(s)."\
    "\nYou have taken #{@guesses} total guess(es)."
  end

  def easy_correct_answer
    puts "Congration you done guessed #{@easy_code} in #{@guesses} guesses "\
    "over #{minutes} minutes and #{seconds} seconds!"
    @guesses = 0
    puts "\nWould you like to (p)lay again or (q)uit?"
  end
end
