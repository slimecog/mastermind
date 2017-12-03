require "time"
require_relative "codes"
require_relative "easy_mode"
require_relative "medium_mode"
require_relative "hard_mode"
require_relative "timer"

class Mastermind
  include Codes
  include EasyMode
  include MediumMode
  include HardMode
  include Timer

  attr_reader :start_time,
              :end_time,
              :input

  def initialize
    @easy_code   ||= easy_code
    @medium_code ||= medium_code
    @hard_code   ||= hard_code
    @start_time    = start_time
    @input         = input
    @guesses       = 0
  end

  puts "Welcome to MASTERMIND!"
  puts "\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"

  def runner_prompt
    loop do
      prompt = "> "
      print prompt
      input = gets.chomp.downcase
      break if input == "q" || input == "quit"
      if input == "p" || input == "play"
        mode_select
      elsif input ==  "i" || input == "instructions"
        instructions
      else puts "Invalid selection. Would you like to (p)lay, read the "\
        "(i)nstructions, or (q)uit?"
      end
    end
  end

  def mode_select
    puts "Would you like to play (e)asy, (m)edium or (h)ard?"
    input = gets.chomp.downcase
    if input == "e" || input == "easy"
      easy_game
    elsif input == "m" || input == "medium"
      medium_game
    elsif input == "h" || input == "hard"
      hard_game
    end
  end

  def instructions
    puts "\nInstructions:"
    puts "Easy Mode: The computer will generate a 4 character code "\
    "consisting of any combination of (r)ed, (g)reen, (b)lue, or (y)ellow."
    puts "\nMedium Mode: The computer will generate a 6 character code "\
    "consisting of any combination of (r)ed, (g)reen, (b)lue, (y)ellow, "\
    "or (o)range."
    puts "\nHard Mode: The computer will generate a 8 character code consisting"\
    " of any combination of (r)ed, (g)reen, (b)lue, (y)ellow, (o)range, "\
    "or (p)urple."
    puts "\nTry to crack the code by typing a combination of the above letters."
    puts "After a guess the computer will reveal how many colors you got "\
    "correct, and how many of those colors are in the correct position."
    puts "\nType (c)heat at any time to reveal the code."
    puts "Type (q)uit at any time to quit the game."
    puts "\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end
end
