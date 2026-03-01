require 'rubocop'
require 'pry-byebug'
require_relative 'node'

class Tree
  attr_accessor :root

  def initialize(array)
    @array = array.uniq.sort
    @arr_start = 0
    @arr_end = @array.length - 1
    p @array
    @root = build_tree(@array, @arr_start, @arr_end)
  end

  def pretty_print(node = @root, prefix = '', is_left: true)
    return unless node

    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", is_left: false)
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", is_left: true)
  end

  def include?(value, root = @root)
    return nil if root == nil
    return true if root.value == value
    return true if include?(value, root.left)
    return true if include?(value, root.right)
    false
  end

  def insert(value, root = @root)
    return unless !self.include?(value)
    return root = Node.new(value) if root == nil
    root.left = insert(value, root.left) if value.integer? && value < root.value
    root.right = insert(value, root.right) if value.integer? && value > root.value
    root
  end

  def delete(value)
    return unless !self.include?(value)

  end

  private

  def build_tree(array, arr_start = @arr_start, arr_end = @arr_end)
    return nil if arr_start > arr_end

    mid = (arr_start + arr_end) / 2
    p "Mid: #{array[mid]}"
    # binding.pry
    root = Node.new(array[mid])

    root.set_left(build_tree(array, arr_start, (mid - 1)))
    root.set_right(build_tree(array, (mid + 1), arr_end))

    root
  end
end