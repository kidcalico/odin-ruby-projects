require 'rubocop'
require 'pry-byebug'
require_relative 'node'

class Tree
  attr_accessor :root

  def initialize(array)
    @array = array.uniq.sort
    @arr_start = 0
    @arr_end = @array.length - 1
    @root = build_tree(@array, @arr_start, @arr_end)
  end

  def pretty_print(node = @root, prefix = '', is_left: true)
    return unless node

    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", is_left: false)
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", is_left: true)
  end

  def include?(value, root = @root)
    return nil if root.nil?
    return true if root.value == value
    return true if include?(value, root.left)
    return true if include?(value, root.right)

    false
  end

  def insert(value, root = @root)
    return if include?(value)
    return root = Node.new(value) if root.nil?

    root.left = insert(value, root.left) if value.integer? && value < root.value
    root.right = insert(value, root.right) if value.integer? && value > root.value
    root
  end

  def delete(value, root = @root)
    return unless include?(value)

    if value < root.value
      root.left = delete(value, root.left)
    elsif value > root.value
      root.right = delete(value, root.right)
    elsif value == root.value
      return root.right if root.left.nil?
      return root.left if root.right.nil?

      successor = replacement(root)
      root.value = successor.value
      root.right = delete(successor.value, root.right)
    end

    root
  end

  def replacement(root)
    current_node = root.right
    current_node = current_node.left while !current_node.nil? && !current_node.left.nil?
    current_node
  end

  def level_order
    return to_enum(:level_order) unless block_given?

    queue = [@root]
    until queue.empty?
      queue << queue[0].left unless queue[0].left.nil?
      queue << queue[0].right unless queue[0].right.nil?
      yield queue.shift.value
    end

    self
  end

  def level_order_recursive(root = @root, index = 0, queue = [], &block)
    return to_enum(:level_order_recursive) unless block_given?
    return if root.value.nil?

    queue << [] if queue.length <= index

    queue[index] << root.value

    level_order_recursive(root.left, index + 1, queue, &block) unless root.left.nil?
    level_order_recursive(root.right, index + 1, queue, &block) unless root.right.nil?

    queue.flatten.each(&block) if index == 0

    self
  end

  def inorder(root = @root, &block)
    return to_enum(:inorder) unless block_given?
    return if root.nil?

    inorder(root.left, &block)
    yield root.value
    inorder(root.right, &block)
    self
  end

  def preorder(root = @root, &block)
    return to_enum(:preorder) unless block_given?
    return if root.nil?

    yield root.value
    preorder(root.left, &block)
    preorder(root.right, &block)
    self
  end

  def postorder(root = @root, &block)
    return to_enum(:postorder) unless block_given?
    return if root.nil?

    postorder(root.left, &block)
    postorder(root.right, &block)
    yield root.value
    self
  end

  def height(value, root = @root)
    return nil unless include?(value)

    current_node = root
    while current_node.value != value
      current_node = current_node.left if value < current_node.value
      current_node = current_node.right if value > current_node.value
    end
    max_height(current_node)
  end

  def depth(value, root = @root, index = 0)
    return nil unless include?(value)
    return index if root.value == value

    index = depth(value, root.left, index + 1) if root.value > value
    index = depth(value, root.right, index + 1) if root.value < value
    index
  end

  def balanced?
    return true unless balanced_recursion == -1

    false
  end

  def rebalance
    arr = inorder.to_a.sort
    @root = build_tree(arr, 0, arr.length - 1)
  end

  private

  def balanced_recursion(root = @root)
    return 0 if root.nil?

    left = balanced_recursion(root.left)
    right = balanced_recursion(root.right)

    return -1 if left == -1 || right == -1
    return -1 if (left - right).abs > 1

    [left, right].max + 1
  end

  def max_height(root = @root)
    return -1 if root.nil?

    left = max_height(root.left)
    right = max_height(root.right)

    [left, right].max + 1
  end

  def build_tree(array, arr_start = @arr_start, arr_end = @arr_end)
    return nil if arr_start > arr_end

    mid = (arr_start + arr_end) / 2
    root = Node.new(array[mid])

    root.left = build_tree(array, arr_start, mid - 1)
    root.right = build_tree(array, mid + 1, arr_end)

    root
  end
end
