require_relative 'lib/tree'

array = Array.new(20) { rand(1..100) }

tree = Tree.new(array)

tree.pretty_print
puts "Balanced? #{tree.balanced?}\n"

puts  "Level Order Traversal: #{tree.level_order.to_a}"
puts  "Inorder Traversal: #{tree.inorder.to_a}"
puts  "Preorder Traversal: #{tree.preorder.to_a}"
puts  "Postorder Traversal: #{tree.postorder.to_a}"

tree.insert(rand(90..110))
tree.insert(rand(90..110))
tree.insert(rand(90..110))

tree.pretty_print
puts "Balanced? #{tree.balanced?}\n"

tree.rebalance

tree.pretty_print
puts "Balanced? #{tree.balanced?}\n"
