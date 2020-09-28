require_relative 'deck'

class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    
    raise ArgumentError.new("Invalid card number : #{ value }") unless (1..13).any? { |card| card == value.to_i } || read_suit_cards(value)
    @value = value.to_s.capitalize

    raise ArgumentError.new("Invalid suit : #{ suit }") unless [:spades , :hearts, :diamonds, :clubs].include? (suit.downcase)  
    @suit = suit.downcase
  end

  def to_s
    return "#{ @value } of #{ @suit }"
  end

  private
  # helper method for suit cards
  def read_suit_cards(value)
    return ["Ace", "Jack", "Queen", "King"].include? (value.capitalize) if value.class == String
  end

end