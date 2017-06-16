require 'card'
HANDS = [:pair, :two_pair, :three_kind, :straight,
         :flush, :full_house, :four_kind, :straight_flush]

class Hand
  def initialize(cards)
    @cards = cards
    # @high_card
  end

  def values
    @cards.map { |card| card.value }
  end

  def suits
    @cards.map { |card| card.suit }
  end

  def beats?(hand)

  end

  def pair?
    @cards.any? do |card|
      values.count(card.value) == 2
    end
  end

  def two_pair?
    @cards.each do |card|

    end
  end

  def three_kind?
    @cards.any? do |card|
      values.count(card.value) == 3
    end
  end
end
