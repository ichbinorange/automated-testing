# require_relative 'card' (it would raise a warning in minitst)

class Deck
  attr_reader :cards

  def initialize(deck_num: 1)
    @cards = Array.new
    [:hearts, :spades, :clubs, :diamonds].each do |suit|
      (1..13).each do |value|
        @cards.push(Card.new(value, suit))
      end
    end
    @cards *= deck_num
  end
  
  def shuffle
    return @cards.shuffle
  end

  def draw(card_num: 1)
    shuffle_card = shuffle
    @draw = shuffle_card.first(card_num).map { |card| card.to_s() }
    shuffle_card.shift(card_num)
    @cards = shuffle_card
    return @draw
  end

  def count
    return @cards.count
  end
end