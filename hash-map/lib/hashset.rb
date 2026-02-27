require_relative 'linkedlist'

class HashSet
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

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code = hash_code % @capacity
  end

  def set(key)
    if !self.has?(key)
      bucket_grow if @capacity * @load_factor <= @count
      @bucket[hash(key)].append(key)
      @count += 1
    end
  end

  def get(key)
    # return index for given key, as there are no values in the set
    @bucket.each_index do |index|
      current_node = @bucket[index].head
      while !current_node.nil?
        return index if current_node.key == key
        current_node = current_node.next_node
      end
    end
  end

  def has?(key)
    return true if self.entries.include?(key)
    false
  end

  def remove(key)
    if self.has?(key)
      @bucket.each_index do |index|
        current_node = @bucket[index].head
        list_index = 0
        while !current_node.nil?
          if current_node.key == key
            @bucket[index].remove_at(list_index)
            return key
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

  def entries
    entries = []
    @bucket.each do |list|
      current_node = list.head
      while !current_node.nil?
        entries << current_node.key
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
      while !current_node.nil?
        self.set(current_node.key)
        current_node = current_node.next_node
      end
    end
  end
end