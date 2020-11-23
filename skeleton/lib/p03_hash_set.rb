class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !include?(key)
      index = key.hash
      @count = count + 1
      resize! if count > store.length
      bucket = index % store.length
      store[bucket] << key
    end
  end

  def remove(key)
    index = key.hash
    bucket = index % store.length
    @count =  count - 1 if store[bucket].delete(key) 

  end

  def include?(key)
    index = key.hash
    bucket = index % store.length
    store[bucket].include?(key)
  end


  private

  def [](key)
    # optional but useful; return the bucket corresponding to `key`
  end

  def num_buckets
    @store.length
  end
  # ammortization
  def resize!
    old_store = store.dup
    num_buckets.times {store << Array.new()}
    
    old_store.each do |sub_arr|
      sub_arr.each do |item|
          bucket = item.hash % old_store.length
          store[bucket].delete(item) 
          bucket = item.hash % store.length
          store[bucket] << item
      end
    end
  end
end
