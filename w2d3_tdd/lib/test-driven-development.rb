class Array
  def my_uniq
    result = []
    self.each do |el|
      result << el unless result.include?(el)
    end
    result
  end

  def two_sum
    result = []
    (0...self.length - 1).each do |i|
      (i + 1...self.length).each do |j|
        if self[i] + self[j] == 0
          result << [i, j]
        end
      end
    end
    result
  end

  def my_transpose
    result = Hash.new { |sh, k| sh[k] = [] }
    self.each do |arr|
      arr.each_with_index do |el, i|
        result[i] << el
      end
    end
    result.values
  end
end

def stock_picker(stocks)
  raise 'Not enough prices!' if stocks.length < 2
  raise 'Must be in numbers!' unless stocks.all? { |price| price.is_a?(Fixnum) }
  profits = Hash.new(0)
  (0...stocks.length - 1).each do |i|
    (i + 1...stocks.length).each do |j|
      pairs = [i, j]
      profits[pairs] = stocks[j] - stocks[i]
    end
  end
  profits.sort_by { |k,v| v }[-1][0]
end
