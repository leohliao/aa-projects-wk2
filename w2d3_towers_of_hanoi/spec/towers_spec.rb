require 'towers'
require 'rspec'

describe Towers do
  let(:new_game) { Towers.new }
  let(:game_over) do
    tower = Towers.new
    tower.move(0,2)
    tower.move(0,1)
    tower.move(2,1)
    tower.move(0,2)
    tower.move(1,0)
    tower.move(1,2)
    tower.move(0,2)
    tower
  end
  let(:mid_game) do
    tower = Towers.new(2)
    tower.move(0,1)
    tower
  end


  describe "#initialize" do
    it 'initializes an array of stacks' do
      expect(new_game.stack).to eq([[3, 2, 1], [], []])
    end
   end

   describe "#won?" do
     it 'returns true if any tower other tower 1 is full' do
       over = game_over.stack[1...game_over.length].any? do |tower|
         tower.length == game_over.length
       end
       expect(over).to eq(true)
     end
   end

   describe "#valid_move?" do
     it 'returns false if from_tower is empty' do
        expect(new_game.valid_move?(1,2)).to eq(false)
     end
     it 'returns false if disk on to_tower is smaller' do
       expect(mid_game.valid_move?(0,1)).to eq(false)
     end
     it 'returns true if to_tower is empty' do
      expect(new_game.valid_move?(0,2)).to eq(true)
     end
   end

   describe "#move" do
     it 'if valid_move? should make move' do
       mid_game.move(1,0)
       expect(mid_game.stack).to eq([[2, 1], []])
     end
     it 'if not valid_move? should do nothing' do
       mid_game.move(0,1)
       expect(mid_game.stack).to eq([[2], [1]])
     end
   end

end
