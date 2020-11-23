class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

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
  include Enumerable

  attr_accessor :head, :tail

  def initialize
    @head = Node.new(0, 0)
    @tail = Node.new(0, 0)
    head.next = tail
    tail.prev = head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    head.next
  end

  def last
    tail.prev
  end

  def empty?
    first == tail
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    node = Node.new(key, val)
    node.next = tail
    node.prev = tail.prev
    tail.prev.next = node
    tail.prev = node
  end

  def update(key, val)
    
  end

  def remove(key)
  end

  def each(&prc)
    pointer = head.next
    while pointer != tail
      prc.call(pointer)
      pointer = pointer.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
