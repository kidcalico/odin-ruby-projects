class LinkedList

  def initialize
    @head = Node.new
  end

  def append(value)
    return @head = Node.new(value) if @head.value.nil?

    current_node = @head
    while current_node.next_node != nil
      current_node = current_node.next_node
    end
    current_node.next_node = Node.new(value)
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def size
    count = 0
    current_node = @head
    while current_node.next_node != nil
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  def head
    @head.value
  end
  
  def tail
    current_node = @head
    while current_node.next_node != nil
      current_node = current_node.next_node
    end
    current_node.value
  end
  
  def at(index)
    current_node = @head
    index.times do
      return nil if current_node == nil
      current_node = current_node.next_node
    end
    current_node.value
  end
  
  def pop
    current_node = @head
    @head = @head.next_node
    current_node.value
  end

  def contains?(value)
    current_node = @head
    while current_node.next_node != nil
      return true if current_node.value == value
      current_node = current_node.next_node
    end
    false
  end

  def index(value)
    index = 0
    current_node = @head
    while current_node.next_node != nil
      return index if current_node.value == value
      current_node = current_node.next_node
      index += 1
    end
    nil
  end

  
  def to_s
    current_node = @head
    string = ""
    return string if current_node == nil
    while current_node.next_node != nil
      string << "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    string << "nil"
  end

  def insert_at(index, *values)
    raise IndexError if index < 0 || index > self.size
    if index == 0
      values.each do |value|
        @head = Node.new(value, @head)
      end
    else
      current_node = @head
      index -= 1
      index.times do
        current_node = current_node.next_node
      end
      values.each do |value|
        current_node.next_node = Node.new(value, current_node.next_node)
      end
    end
  end

  def remove_at(index)
    raise IndexError if index < 0 || index > self.size
    if index == 0
      @head = head.next_node
    else
      current_node = @head
      index -= 1
      index.times do
        current_node = current_node.next_node
      end
      current_node.next_node = current_node.next_node.next_node
    end
  end
end