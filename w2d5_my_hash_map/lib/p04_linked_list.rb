require 'byebug'

class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = tail
    @tail.prev = head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    empty? ? nil : @head.next
  end

  def last
    empty? ? nil : @tail.prev
  end

  def empty?
    @tail.prev == @head
  end

  def get(key)
    # debugger
    # unless empty?
      current_link = first

      until current_link == last.next || current_link.key == key
        current_link = current_link.next
      end

      current_link.val

  end

  def include?(key)
    current_link = first
    until current_link == last.next
      return true if current_link.key == key
      current_link = current_link.next
    end
    false
  end

  def append(key, val)
    # debugger
    new_link = Link.new(key, val)
    new_link.prev = @tail.prev
    new_link.next = @tail
    @tail.prev.next = new_link
    @tail.prev = new_link

  end

  def update(key, val)
    unless empty?
      current_link = first

      until current_link.key == key
        current_link = current_link.next
      end

      current_link.val = val
    end
  end

  def remove(key)
    current_link = first
    # debugger

    while current_link.key != key && current_link.next != last
      current_link = current_link.next
    end
    return nil if current_link.next == last
    # debugger
    if current_link.key == key
      current_link.prev.next = current_link.next
      current_link.next.prev = current_link.prev
      # current_link.next = nil
      # current_link.prev = nil
      return nil
    end
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
