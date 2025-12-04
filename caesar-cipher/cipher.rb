def caesar_cipher(string, shift)
  arr = string.split('')
  cipher = arr.map do |char|
    if char >= "A" && char <= "Z"
      num = char.ord - "A".ord + 1 + shift
      if num > 26
        num -= 26
        num
      end
      (num + 64).chr
    elsif char >= "a" && char <= "z"
      num = char.ord - "a".ord + 1 + shift
      if num > 26
        num -= 26
        num
      end
      (num + 96).chr
    else
      char
    end
  end
  string = cipher.join('')
  puts string
end

# caesar_cipher("Hello my name is mud!", 7)

puts "Enter a string:"
str = gets.chomp
puts "Enter an integer (1-26):"
int = gets.chomp.to_i
caesar_cipher(str, int)