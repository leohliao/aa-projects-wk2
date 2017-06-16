require 'card'

class Deck
attr_reader :stack


  def initialize
    @stack =[]
    @graveyard = []

    52.times do |i|
      value = i % 13
      suit_idx = i % 4
      @stack << Card.new($CARDS[value], $SUITS[suit_idx])
    end
  end

  def shuffle!
    @stack.shuffle!
  end

  def deal_card
    @graveyard << @stack.pop
  end

  def reset_deck
    @stack.concat(@graveyard)
    @graveyard = []
    shuffle!
  end

end
