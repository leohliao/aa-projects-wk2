class LRUCache

    def initialize(cache_size)
      @cache_hash = []
      @cache_size = cache_size
    end

    def count
      # returns number of elements currently in cache
      @cache_hash.count
    end

    def add(el)
      # adds element to cache according to LRU principle
      if @cache_hash.include?(el)
        @cache_hash.delete(el)
        @cache_hash << el
      elsif count >= @cache_size
        @cache_hash.shift
        @cache_hash << el
      else
        @cache_hash << el
      end

    end

    def show
      # shows the items in the cache, with the LRU item first
      p @cache_hash
      nil
    end

    private
    # helper methods go here!

  end


  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})

p johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
