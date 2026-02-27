require_relative 'node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(key, value = nil)
    return @head = Node.new(key, value) if @head == nil
    current_node = @head
    while current_node.next_node != nil
      current_node = current_node.next_node
    end
    current_node.next_node = Node.new(key, value)
  end

  def prepend(key, value)
    current_node = @head
    @head = Node.new(key, value, current_node)
  end

  def size
    return 0 if @head == nil
    current_node = @head
    count = 1
    while !current_node.next_node.nil?
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  def head_value
    return nil if @head == nil
    @head.value
  end
  
  def head_key
    return nil if @head == nil
    @head.key
  end

  def tail
    return nil if @head == nil
    current_node = @head
    while !current_node.next_node.nil?
      current_node = current_node.next_node
    end
    current_node.value
  end

  def at(index)
    return nil if @head == nil || index >= self.size
    current_node = @head
    index.times do
      current_node = current_node.next_node
    end
    current_node.value
  end

  def pop
    return nil if @head == nil
    current_node = @head
    @head = @head.next_node
    current_node.value
  end

  def contains?(value)
    return false if @head == nil
    current_node = @head
    while !current_node.next_node.nil? do
      return true if current_node.value == value
      current_node = current_node.next_node
    end
    false
  end

  def index(key)
    return nil if @head == nil
    current_node = @head
    count = 0
    while current_node.next_node != nil do
      return count if current_node.key == key
      count += 1
      current_node = current_node.next_node
    end
    return count if current_node.key == key
    nil
  end

  def insert_at(index, *values)
    raise IndexError if index < 0 || index > self.size
    current_node = @head
    index -= 1 if index > 0
    (index - 1).times { current_node = current_node.next_node }
    values.each { |value| current_node.next_node = Node.new(value, current_node.next_node) }
  end

  def remove_at(index)
    raise IndexError if index < 0 || index >= self.size
    current_node = @head
    return self.pop if index == 0
    (index - 1).times { current_node = current_node.next_node }
    value = current_node.next_node.value
    current_node.next_node = current_node.next_node.next_node
    value
  end


  def to_s
    return "" if @head == nil
    current_node = @head
    result = ""
    while !current_node.next_node.nil?
      result << "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    result << "( #{current_node.value} ) -> nil"
  end
end