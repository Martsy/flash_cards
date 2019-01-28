require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/deck'

class DeckTest < Minitest::Test

  def test_card_1_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    assert_instance_of Card, card_1
  end

  def test_card_2_exists
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    assert_instance_of Card, card_2
  end

  def test_card_3_exists
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    assert_instance_of Card, card_3
  end

  def test_cards_equal_array_of_cards
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    assert_equal cards = [card_1, card_2, card_3], cards
  end

  def test_deck_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new
    assert_instance_of Deck, deck
  end
end