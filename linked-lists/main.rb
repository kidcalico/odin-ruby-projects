require_relative './lib/linkedlist'
require_relative './lib/node'

list = LinkedList.new

list.append('dog')
list.append('snake')
list.append('turtle')
list.append('rabbit')
list.append('gila monster')
list.append('alligator')
list.append('tiger')
list.append('fox')

puts list.index('alligator')
puts list

# puts list.head
# puts list.tail

# list.prepend('dinosaur')

# puts list
# puts list.at(1)
# puts list.contains?('rabbit')
# puts list.contains?('skink')
# puts list.index('rabbit')
# puts list.index('skink')
# puts list.insert_at(8, "chinchilla", 'horse')
# puts list
# puts list.size
# list.remove_at(3)
# puts list