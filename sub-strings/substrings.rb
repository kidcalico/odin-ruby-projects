dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string, dictionary)
  # In case that the string argument is more than one word, split it
  # into an array. Using #reduce for each word in the dictionary array,
  # counting how many times it occurs in the string array, whether as a
  # string or a substring, and returning the totals for each word (>0)
  # as a hash.

  arr = string.downcase.split(' ')
  dictionary.reduce(Hash.new(0)) do |word, entry|
    arr.each do |string| 
      word[entry] += 1 if string.include?(entry)
    end
    word
  end
end

# Allow for user interaction in REPL
puts "Please enter a string:"
str = gets.chomp.to_s
puts "Enter words to add to your dictionary, separated by spaces, no punctuation please:"
new_words = gets.chomp.downcase.split(' ')
new_words.each { |word| dictionary << word }
puts substrings(str, dictionary)