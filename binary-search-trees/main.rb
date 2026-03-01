require_relative 'lib/tree'

# arr = []
# 20.times do
#   arr << rand(1000)
# end
arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

# arr = [1, 2, 3, 4, 5]

tree = Tree.new(arr)
tree.pretty_print
p tree.include?(23)
p tree.include?(24)
p tree.include?(324)
tree.insert(100)
tree.insert(2)
tree.insert(68)
tree.pretty_print
# p tree.root
# p tree.root.value