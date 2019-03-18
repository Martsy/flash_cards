class Round
  attr_reader :deck,
              :turns,
              :guess_count

  def initialize(deck)
    @deck        = deck
    @turns       = []
    @guess_count = 0
  end

  def current_card
    @deck.cards[guess_count]
  end

  def take_turn(guess)
    @turns << new_turn = Turn.new(guess, current_card)
    @guess_count += 1
    new_turn
  end

  def number_correct
    @turns.count(&:correct?)
  end

  def turns_in_category(category)
    @turns.count { |turn| turn.card.category == category }
  end

  def number_correct_by_category(category)
    @turns.count { |turn| turn.correct? && turn.card.category == category }
  end

  def percent_correct
    (number_correct.to_f / turns.count * 100).round(1)
  end

  def percent_correct_in_category(category)
    number_correct_by_category(category).to_f /
      turns_in_category(category) * 100
  end

  def category_results
    deck.categories.each { category }
    puts "#{category}: #{percent_correct_in_category}%"
  end

  def start
    puts '*' * 39
    puts "*Welcome! You're playing with #{@deck.count} cards.*"
    puts '*' * 39
    @deck.cards.each { new_question }
    end_of_game
  end

  def new_question
    puts "This is card number #{@turns.count + 1} out of #{@deck.count}."
    puts "Question: #{current_card.question}"
    guess = gets.chomp.downcase.capitalize
    new_turn = take_turn(guess)
    puts new_turn.feedback
  end

  def end_of_game
    puts '****** Game over! ******'
    puts "You had #{number_correct} correct guesses out of #{@turns.count}"
    puts "TOTAL SCORE: #{percent_correct}%."
  end
end
