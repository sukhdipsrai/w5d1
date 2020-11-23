class MaxIntSet

  attr_reader :store
  def initialize(max)
    @store = Array.new(max){false}
  end

  def insert(num)
    validate!(num)
    self.store[num] = true
  end

  def remove(num)
    validate!(num)
    store[num] = false
  end

  def include?(num)
    validate!(num)
    store[num]
  end

  private

  def is_valid?(num)
    num >= 0 && num < store.length
  end

  def validate!(num)
    raise 'Out of bounds' if !is_valid?(num)
  end
end


class IntSet

  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket = num % 20
    store[bucket] << num
  end

  def remove(num)
    bucket = num % 20
    store[bucket].delete(num)
  end

  def include?(num)
    bucket = num % 20
    store[bucket].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count,:store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !include?(num)
      @count = count + 1
      resize! if count > store.length
      bucket = num % store.length
      store[bucket] << num
    end
  end

  def remove(num)
    bucket = num % store.length
    @count =  count - 1 if store[bucket].delete(num) 

  end

  def include?(num)
    bucket = num % store.length
    store[bucket].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    num_buckets.times {store << Array.new()}
  end

end
