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
    while !current_node.nil? && !current_node.left.nil?
      current_node = current_node.left
    end
    return current_node
  end

  def level_order
    return to_enum(:level_order) unless block_given?
    queue = [@root]
    while !queue.empty?
      queue << queue[0].left if !queue[0].left.nil?
      queue << queue[0].right if !queue[0].right.nil?
      yield queue.shift.value
    end
  end

  private

  def build_tree(array, arr_start = @arr_start, arr_end = @arr_end)
    return nil if arr_start > arr_end

    mid = (arr_start + arr_end) / 2
    root = Node.new(array[mid])

    root.left = build_tree(array, arr_start, mid - 1)
    root.right = build_tree(array, mid + 1, arr_end)

    root
  end
end
