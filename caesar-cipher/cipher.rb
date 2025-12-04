def caesar_cipher(string, shift)
  shift %= 26
  arr = string.split('')
  cipher = arr.map do |char|
    if char >= "A" && char <= "Z"
      num = char.ord - "A".ord + 1 + shift
      ((num%26) + 64).chr
    elsif char >= "a" && char <= "z"
      num = char.ord - "a".ord + 1 + shift
      ((num%26) + 96).chr
    else
      char
    end
  end
  string = cipher.join('')
  string
end

puts "Enter a string:"
str = gets.chomp
puts "Enter an integer:"
int = gets.chomp.to_i
cipher = caesar_cipher(str, int)
puts "Your message, encrypted:\n#{cipher}"