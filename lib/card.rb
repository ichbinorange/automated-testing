require_relative 'deck'

class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    raise ArgumentError.new("Invalid card number : #{ value }") unless (1..13).include? (value.to_i)
    @value = value.to_i

    raise ArgumentError.new("Invalid suit : #{ suit }") unless [:spades , :hearts, :diamonds, :clubs].include? (suit.downcase)  
    @suit = suit.downcase
  end

  def to_s
    return "#{ @value } of #{ @suit }"
  end

end