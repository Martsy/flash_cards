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
    new_turn
  end

  def number_correct
    @turns.count(&:correct?)
  end

  def number_correct_by_category(category)
    @turns.count { |turn| turn.correct? && turn.card.category == category }
  end

  def percent_correct
    (number_correct.to_f / turns.count * 100)
  end
end
