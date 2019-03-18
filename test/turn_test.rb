require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_turn_class_exists
    assert_instance_of Turn, @turn
  end

  def test_turn_card_returns_the_card
    assert_equal @card, @turn.card
  end

  def test_turn_returns_guess
    assert_equal "Juneau", @turn.guess
  end

  def test_turn_when_guess_is_correct
    assert @turn.correct?
  end

  def test_turn_knows_a_correct_answer
    assert_equal "Correct!", @turn.feedback
  end

  def test_turn_knows_an_incorrect_answer
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    refute turn.correct?
  end

  def test_turn_knows_an_incorrect_answer_feedback
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    assert_equal "Incorrect.", turn.feedback
  end
end
