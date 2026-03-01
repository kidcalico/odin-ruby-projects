class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def set_left(left)
    @left = left
  end

  def set_right(right)
    @right = right
  end

  def get_left
    @left
  end

  def get_right
    @right
  end
end