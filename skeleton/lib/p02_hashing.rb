class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    self << 1 if self.empty?
    h = self.map {|ele| (ele ** self.index(ele)).hash}
    h.inject {|acc, ele| acc ^ ele}
  end
end

class String
  def hash
    self.split("").map{|ele| ele.to_i}

  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end

p ("Hello").hash