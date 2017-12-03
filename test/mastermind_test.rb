require_relative "test_helper"
require_relative "../lib/game"

class MastermindTest < Minitest::Test

  def test_it_exists
    mm = Mastermind.new

    assert_instance_of Mastermind, mm
  end

  def test_instructions_output
    mm = Mastermind.new

    assert_nil mm.instructions
  end #this method returns nil because it uses puts statements

  def test_code_output
    mm = Mastermind.new

    assert_equal 4, mm.easy_code.length
    assert_equal 6, mm.medium_code.length
    assert_equal 8, mm.hard_code.length
  end

  def test_cheat_output
    mm = Mastermind.new

    assert_nil mm.easy_cheat
    assert_nil mm.medium_cheat
    assert_nil mm.hard_cheat
  end

  def test_start_instructions_output
    mm = Mastermind.new

    assert_nil mm.easy_start_instructions
    assert_nil mm.medium_start_instructions
    assert_nil mm.hard_start_instructions
  end

  def test_incorrect_guess_length_output
    mm = Mastermind.new

    assert_equal "The code is four digits long. Try again.", mm.easy_incorrect_guess_length
    assert_equal "The code is six digits long. Try again.", mm.medium_incorrect_guess_length
    assert_equal "The code is eight digits long. Try again.", mm.hard_incorrect_guess_length
  end
end
