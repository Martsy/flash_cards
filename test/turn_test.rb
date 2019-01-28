require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/turn'

class TurnTest < Minitest::Test

  def test_turn_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_instance_of Turn, turn
  end

  def test_the_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_equal "Juneau", turn.guess
  end

  def test_if_correct
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_equal true, turn.correct?
  end

  def test_if_incorrect
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Denver", card)
    assert_equal false, turn.correct?
  end

  def test_feedback_positive
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_equal "Correct", turn.feedback
  end

  def test_feedback_negative
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Denver", card)
    assert_equal "Incorrect", turn.feedback
  end

  def test_returns_correct_card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_equal card, turn.card
  end
end
