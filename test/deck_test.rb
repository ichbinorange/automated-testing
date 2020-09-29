require_relative 'test_helper'

describe Deck do
  # Write tests for the Deck class.
  # What should you test?
    # 1.  Expected Behavior
    # 2.  Edge cases
  describe "You can create a Deck instance" do
    it "Can be created with 52 cards" do
      new_deck = Deck.new
      expect(new_deck).must_be_instance_of Deck
      
      new_deck.cards.each do |card|
        expect(card).must_be_instance_of Card
      end
  
      expect(new_deck.cards).must_be_instance_of Array
      expect(new_deck.count()).must_equal 52
    end
  end
  
  describe "Testing draw" do
    it "draw returns a readable String value" do
      new_deck = Deck.new
      expect(new_deck.draw).must_be_instance_of Array

      new_deck.draw.each do |card|
        expect(card).must_be_instance_of String
      end
    end

    it "draw removes cards from the Decks" do
      new_deck = Deck.new
      new_deck.draw
      expect(new_deck.count()).must_equal 51
      
      new_deck = Deck.new
      new_deck.draw(card_num: "3")
      expect(new_deck.count()).must_equal 49

      two_decks = Deck.new(deck_num: 2)
      two_decks.draw(card_num: 4)
      expect(two_decks.count()).must_equal 100
    end

    it "Raises an ArgumentError for invalid cards to draw" do
      new_deck = Deck.new
      expect{new_deck.draw(card_num: 53)}.must_raise ArgumentError

      new_deck = Deck.new
      expect{new_deck.draw(card_num: -1)}.must_raise ArgumentError

      new_deck = Deck.new
      expect{new_deck.draw(card_num: nil)}.must_raise ArgumentError
    end
  end

end
