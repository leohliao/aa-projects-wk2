require 'byebug'
class Fixnum
  # Fixnum#hash already implemented for yous
end

class Array
  def hash
    return 2143242 if self.empty?
    object = self.map.with_index { |el, idx| el.hash + idx.hash }
    object.inject(:^)
  end
end

class String
  def hash
    return self.ord if self.size == 1
    ary_version = self.split("")
    ary_version.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    ary = self.sort
    sum = 0

    ary.each do |sub_array|
      # p sub_array
      sum+= sub_array.hash
    end

    sum
  end
end

hash = {a: 2, b:3}
hash.hash
