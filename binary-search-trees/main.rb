require_relative 'lib/tree'

# arr = []
# 20.times do
#   arr << rand(1000)
# end

arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

tree = Tree.new(arr)
tree.pretty_print

tree.insert(100)
tree.insert(2)
tree.insert(68)
tree.insert(102)

tree.delete(4)
tree.pretty_print
tree.level_order { |node| print "#{node} " }
print "\n"
p tree.level_order.to_a