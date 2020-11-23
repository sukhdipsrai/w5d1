require_relative 'p04_linked_list'

class HashMap
  attr_accessor :count,:store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    ll = bucket(key)
    if !include?(key)
      ll.append(key,val) 
      @count  = count + 1
    else
      ll.update(key,val)
    end   
  end

  def get(key)
    bucket(key).get(key)

  end

  def delete(key)
    bucket(key).remove(key)
    @count  = count - 1
  end

  def each
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    old_store = store.dup
    # not working 
    num_buckets.times {store << LinkedList.new }
    
    old_store.each do |linked_lists|
      linked_lists.each do |node|
        # k = node.key
        # oldbucket = store[k.hask % old_store.length]
        # oldbucket.remove(k)
        set(node.key, node.val)
      end
    end
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    self.store[key.hash%num_buckets]
  end
end
