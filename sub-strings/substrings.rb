dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string, dictionary)
  arr = string.downcase.split(' ')
  dictionary.reduce(Hash.new(0)) do |word, entry|
    arr.each do |string| 
      word[entry] += 1 if string.include?(entry)
    end
    word
  end
end

puts "Please enter a string:"
str = gets.chomp.to_s
puts "Enter words to add to your dictionary, separated by spaces, no punctuation please:"
new_words = gets.chomp.downcase.split(' ')
new_words.each { |word| dictionary << word }
puts substrings(str, dictionary)