class Turn
  attr_reader :guess, :card

  def initialize(guess, card)
    @guess = guess
    @card = card
  end

  def correct?
    return @card.answer == @guess
  end

  def feedback
    if correct?
      "Correct"
    else
      "Incorrect"
    end
  end
end
