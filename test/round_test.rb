require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test
  def setup
    @card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    @card2 = Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM)
    @card3 = Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM)
    @cards  = [@card1, @card2, @card3]
    @deck   = Deck.new([@card1, @card2, @card3])
    @round  = Round.new(@deck)
  end

  def test_deck_class_exists
    assert_instance_of Round, @round
  end

  def test_deck_returns_round
    assert_equal @deck, @round.deck
  end

  def test_deck_starts_with_no_turns
    assert_equal [], @round.turns
  end

  def test_round_has_current_card
    assert_equal @card1, @round.current_card
  end

  def test_round_has_take_turn
    new_turn = @round.take_turn('Juneau')
    assert_equal @card1, new_turn.card
  end

  def test_new_turn_class
    new_turn = @round.take_turn('Juneau')
    assert_equal Turn, new_turn.class
  end

  def test_new_turn_returns_true_for_a_correct_guess
    new_turn = @round.take_turn('Juneau')
    assert_equal true, new_turn.correct?
  end

  def test_round_has_turns_with_card_in_turns_array
    new_turn = @round.take_turn('Juneau')
    assert_equal [new_turn], @round.turns
  end

  def test_round_counts_number_correct
    @round.take_turn('Juneau')
    assert_equal 1, @round.number_correct
  end

  def test_round_can_take_a_new_turn_with_next_card
    @round.take_turn('Juneau')
    assert_equal @card2, @round.current_card
  end

  def test_round_has_take_another_turn
    @round.take_turn('Juneau')
    new_turn = @round.take_turn('Mars')
    assert_equal @card2, new_turn.card
  end

  def test_new_turn_returns_false_for_incorrect_answer
    new_turn = @round.take_turn('Mars')
    assert_equal false, new_turn.correct?
  end

  def test_count_is_updated_with_each_turn
    @round.take_turn('Juneau')
    @round.take_turn('Mars')
    assert_equal 2, @round.turns.count
  end

  def test_feedback_is_negative
    @round.take_turn('Juneau')
    @round.take_turn('Venus')
    assert_equal 'Incorrect.', @round.turns.last.feedback
  end

  def test_the_number_correct_in_round
    @round.take_turn('Juneau')
    @round.take_turn('Venus')
    assert_equal 1, @round.number_correct
  end

  def test_the_number_correct_by_category_geography
    @round.take_turn('Juneau')
    @round.take_turn('Venus')
    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_percent_correct
    @round.take_turn('Juneau')
    @round.take_turn('Venus')
    assert_equal 50.0, @round.percent_correct
  end

  def test_percent_correct_in_category
    @round.take_turn('Juneau')
    @round.take_turn('Venus')
    assert_equal 100.0, @round.percent_correct_in_category(:Geography)
  end
end
