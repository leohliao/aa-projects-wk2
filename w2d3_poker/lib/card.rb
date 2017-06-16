$CARDS = [
  :two, :three, :four, :five, :six, :seven,
  :eight, :nine, :ten, :jack, :queen, :king, :ace
]
$SUITS = [:spades, :clubs, :diamonds, :hearts]

class Card
  attr_reader :value, :suit

  def  initialize(value, suit)
    @value = value
    @suit = suit
  end

  def ==(card)
    card.value == self.value &&
      card.suit == self.suit
  end

  def to_s
    puts "#{@value} of #{@suit}"
  end

  def <=>(other_card)
    @value <=> other_card.value
  end


end
