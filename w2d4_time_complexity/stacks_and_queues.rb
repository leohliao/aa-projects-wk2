class MyQueue

  def initialize
    @store = []
  end

  def enqueue(element)
    @store.push(element)
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

end

class MyStack
attr_reader :store
  def intialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(element)
    @store << element
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

end

class StackQueue

  def initialize
    @in = MyStack.new
    @out = MyStack.new
  end

  def enqueue(element)
    @in.push(element)
  end

  def dequeue
    if @out.empty?
      until @in.empty?
        @out.push(@in.pop)
      end
    end
    @out.pop
  end

  def size
    @in.size + @out.size
  end

  def empty?
    @in.empty? && @out.empty?
  end

end

#
# sa = StackQueue.new
#
# sa.enqueue(0)
