require 'test-driven-development'
require 'rspec'

describe Array do
  let(:duplicates) { [1, 2, 2, 3, 3, 4] }
  let(:no_dup) { [1, 2, 3, 4] }
  let(:zero_sum) { [-1, 0, 1, 2, -2] }
  let(:matrix) { [[1, 2, 3], [4, 5, 6], [7, 8, 9]] }

  describe "#my_uniq" do
    it 'do nothing within an array with no duplicates' do
      expect(no_dup.my_uniq).to eq(no_dup)
    end

    it 'removes duplicates from an array' do
      expect(duplicates.my_uniq).to eq(no_dup)
    end

    it 'returns empty array if given array is empty' do
      expect([].my_uniq).to eq([])
    end
  end

  describe "#two_sum" do
    it 'adds two numbers inside array and returns indices if sum is 0' do
      expect(zero_sum.two_sum).to eq([[0, 2], [3, 4]])
    end

    it 'returns empty array if given array is empty' do
      expect([].two_sum).to eq([])
    end
  end

  describe "#my_transpose" do
    it 'returns the transpose' do
      expect(matrix.my_transpose).to eq([[1, 4, 7], [2, 5, 8], [3, 6, 9]])
    end

    it 'returns empty array if given array is empty' do
      expect([].my_transpose).to eq([])
    end
  end
end

describe "#stock_picker" do
  let(:stock_prices) { [20, 24, 22, 18, 19, 23, 25, 22] }
  let(:single_stock) { [34] }
  let(:string_stock) { [34, "a", "b"] }

    it 'should return pairs of indices representing biggest profits' do
      expect(stock_picker(stock_prices)).to eq([3,6])
    end

    it 'should raise error if stock prices is empty' do
      expect{ stock_picker(single_stock) }.to raise_error('Not enough prices!')
    end

    it 'should raise error if stock prices are not integers' do
      expect{ stock_picker(string_stock) }.to raise_error('Must be in numbers!')
    end

end
