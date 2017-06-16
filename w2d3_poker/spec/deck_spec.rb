require 'deck'
require 'rspec'

describe Deck do
  let(:new_deck) { Deck.new }

  describe "#initialize" do
    it 'populates a deck' do
      expect(new_deck.stack.length).to eq(52)
    end
    it 'make sure all the card are uniq' do
      uniq = true
      (0...51).each do |i|
        (i+1..51).each do |j|
        uniq = false if new_deck.stack[i] == new_deck.stack[j]
        end
      end
      expect(uniq).to eq(true)
    end
  end

  

end
