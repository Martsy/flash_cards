class Round
  attr_reader :deck, :turns, :guess_count

  def initialize(deck)
    @deck = deck
    @turns = []
    @guess_count = 0
  end

  def current_card
    @deck.cards[guess_count]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @guess_count += 1
    return new_turn
  end

  def number_correct
    @turns.count { |turn| turn.correct? }
  end

end
