require_relative 'lib/hashmap'
require_relative 'lib/hashset'

hash_set = HashSet.new

hash_set.set('tornado')
hash_set.set('earthquake')
hash_set.set('hurricane')
hash_set.set('flood')
hash_set.set('fire')
hash_set.set('typhoon')
hash_set.set('cyclone')
hash_set.set('landslide')
hash_set.set('avalanche')
hash_set.set('avalanche')
p hash_set.entries
p hash_set.remove('fire')
p hash_set.entries
p hash_set.get('flood')

# list = LinkedList.new

# list.append('dog', 'brown')
# list.append('cat', 'orange')
# list.append('parrot', 'red')
# list.append('hamster', 'white')
# list.append('snake', 'green')
# list.append('turtle', 'dark green')
# puts list
# puts list.pop
# puts list
# puts list.remove_at(4)
# puts list

# test = HashMap.new
# test.set('apple', 'red')
# test.set('banana', 'yellow')
# test.set('carrot', 'orange')
# test.set('dog', 'brown')
# test.set('elephant', 'gray')
# test.set('frog', 'green')
# test.set('grape', 'purple')
# test.set('hat', 'black')
# test.set('ice cream', 'white')
# test.set('jacket', 'blue')
# test.set('kite', 'pink')
# test.set('lion', 'golden')
# p test.entries
# p test.count
# test.set('moon', 'silver')
# p test.entries
# test.set('moon', 'cheese')
# p test.entries
# p test.remove('moon')
# p test.entries
# p test.remove('lion')
# p test.entries
# p test.get('jacket')
# test.set('hammer', 'time')
# test.set('beethoven', 'fifth')
# p test.entries