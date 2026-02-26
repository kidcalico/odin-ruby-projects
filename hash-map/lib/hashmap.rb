require_relative 'linkedlist'

class HashMap
  attr_accessor :bucket, :count

  def initialize
    @capacity = 16
    @load_factor = 0.75
    @bucket = Array.new(@capacity) { LinkedList.new }
    @count = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    # constant = ((5.0 ** 0.5) - 1)/2

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code = hash_code % @capacity
  end

  def set(key, value)
    if self.has?(key)
      # find the node with the key and reassign value
      current_node = @bucket[hash(key)].head
      while current_node.key != key
        current_node = current_node.next_node
      end
      current_node.value = value
    else
      bucket_grow if @capacity * @load_factor <= @count
      @bucket[hash(key)].append(key, value)
      @count += 1
    end
  end
    
  def get(key)
    @bucket.each do |list|
      current_node = list.head
      while !current_node.nil?
        return current_node.value if current_node.key == key
        current_node = current_node.next_node
      end
    end
    nil
  end

  def has?(key)
    return true if self.keys.include?(key)
    false
  end

  def remove(key)
    if self.has?(key)
      @bucket.each_index do |index|
        current_node = @bucket[index].head
        list_index = 0
        while !current_node.nil? do
          if current_node.key == key
            value = current_node.value
            @bucket[index].remove_at(list_index)
            return value
          end
          current_node = current_node.next_node
          list_index += 1
        end        
      end
    end
  end

  def length
    self.keys.count { |node| node != nil }
  end

  def clear
    @bucket = Array.new(@capacity) { LinkedList.new }
  end

  def keys
    @bucket_keys = []
    @bucket.each do |list|
      current_node = list.head
      while !current_node.nil?
        @bucket_keys << current_node.key
        current_node = current_node.next_node
      end
    end
    @bucket_keys
  end

  
  def values
    @bucket_values = []
    @bucket.each do |list|
      current_node = list.head
      while !current_node.nil?
        @bucket_values << current_node.value
        current_node = current_node.next_node
      end
    end
    @bucket_values
  end

  def entries
    entries = []
    @bucket.each do |list|
      current_node = list.head
      while !current_node.nil?
        entries << [ current_node.key, current_node.value ]
        current_node = current_node.next_node
      end
    end
    entries
  end

  def bucket_grow
    @count = 0
    @capacity = @capacity * 1.5 if @capacity > 16
    @capacity = @capacity * 2 if @capacity == 16

    re_hash
  end

  def re_hash
    old_bucket = @bucket.dup
    @bucket = Array.new(@capacity) { LinkedList.new }
    old_bucket.each do |node|
      current_node = node.head
      while !current_node.nil? do
        self.set(current_node.key, current_node.value)
        current_node = current_node.next_node
      end
    end
  end
end

list = LinkedList.new

list.append('dog', 'brown')
list.append('cat', 'orange')
list.append('parrot', 'red')
list.append('hamster', 'white')
list.append('snake', 'green')
list.append('turtle', 'dark green')
puts list
puts list.pop
puts list
puts list.remove_at(4)
puts list

# test = HashMap.new
# test.set('apple', 'red')
# test.set('banana', 'yellow')
# test.set('carrot', 'orange')
# test.set('dog', 'brown')
# test.set('elephant', 'gray')
# test.set('frog', 'green')
# test.set('grape', 'purple')
# test.set('hat', 'black')
# test.set('ice cream', 'white')
# test.set('jacket', 'blue')
# test.set('kite', 'pink')
# test.set('lion', 'golden')
# p test.entries
# p test.count
# test.set('moon', 'silver')
# p test.entries
# test.set('moon', 'cheese')
# p test.entries
# p test.remove('moon')
# p test.entries
# p test.remove('lion')
# p test.entries
# p test.get('jacket')
# test.set('hammer', 'time')
# test.set('beethoven', 'fifth')
# p test.entries