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

    raise ArgumentError.new("Not enough cards to draw: current: #{ @cards.count } vs input #{ card_num.to_i }") if @cards.count < card_num.to_i || card_num.to_i < 1 || card_num.to_i.nil?
    
    shuffle_card = shuffle
    @draw = shuffle_card.first(card_num.to_i).map { |card| card.to_s() }
    shuffle_card.shift(card_num.to_i)
    @cards = shuffle_card
    return @draw
  end

  def count
    return @cards.count
  end
end