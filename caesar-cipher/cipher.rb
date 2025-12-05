def caesar_cipher(string, shift)
  # Apply modulus to integer to keep the number within 26
  shift %= 26

  # Split the string into an array, map characters to numbers, apply 
  # the shift and convert each back to a character.
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

  # Join array and return string
  string = cipher.join('')
  string
end

# For user interaction in the REPL
puts "Enter a string:"
str = gets.chomp
puts "Enter an integer:"
int = gets.chomp.to_i
puts "Your message, encrypted:"
puts caesar_cipher(str, int)