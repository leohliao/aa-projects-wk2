class Towers
  attr_reader :stack, :length

  def initialize(length=3)
    @length = length
    @stack = Array.new(length) { Array.new }
    length.downto(1).each do |i|
      @stack[0] << i
    end
  end

  def get_input
    print "Where do you want to move from? "
    from_tower = gets.chomp.to_i
    print "Where do you want to move to? "
    to_tower = gets.chomp.to_i

    raise InvalidInputError unless [from_tower, to_tower].all? do |n|
      n.between?(1, @length)
    end

    [from_tower - 1, to_tower - 1]

    rescue InvalidInputError
      puts "Invalid Type!"
      retry
  end

  def won?
    @stack[1..@length].any? { |tower| tower.length == @length }
  end

  def valid_move?(from_tower, to_tower)
    if @stack[from_tower].empty?
      return false
    elsif @stack[to_tower].empty?
      return true
    else
      @stack[to_tower].last > @stack[from_tower].last
    end
  end

  def move(from_tower, to_tower)
    if valid_move?(from_tower, to_tower)
      @stack[to_tower].push(@stack[from_tower].pop)
    else
      puts "Invalid move!"
    end
  end

  def play
    until won?
      display
      from_tower, to_tower = get_input
      move(from_tower, to_tower) if valid_move?(from_tower, to_tower)
    end
    display
    puts "You Win!!!"
  end

  def display
    @stack.each_with_index do |tower, i|
      puts "Tower #{i+1}: #{tower}"
    end
  end

end

class InvalidInputError < StandardError
end

if __FILE__ == $PROGRAM_NAME
  tower = Towers.new(5)
  tower.play
end
