require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  end

  def test_card_class_exists
    assert_instance_of Card, @card
  end

  def test_card_has_question
    assert_equal "What is the capital of Alaska?", @card.question
  end

  def test_card_has_answer_to_question
    assert_equal "Juneau", @card.answer
  end

  def test_card_has_a_category
    assert_equal :Geography, @card.category
  end
end
