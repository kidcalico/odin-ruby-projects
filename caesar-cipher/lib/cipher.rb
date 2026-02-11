class Cipher
  attr_reader :cipher

  def initialize(string = nil, shift = nil)
    @string = string
    @shift = shift
  end
  
  def run_cipher
    get_string
    get_shift
    caesar_cipher
    output
  end

  def get_string
    print "Enter a string: "
    verify_string
  end

  def get_shift
    print "Enter an integer: "
    verify_shift
  end

  def verify_string
    loop do
      @string = gets.chomp
      return @string if @string.length > 1
    end
  end

  def verify_shift
    loop do
      @shift = gets.chomp.to_i
      return @shift if @shift.is_a?(Integer)
    end
  end

  def caesar_cipher
    # Apply modulus to integer to keep the number within 26
    # @shift %= 26
  
    # Split the string into an array, map characters to numbers, apply
    # the shift and convert each back to a character.
    @cipher = @string.split("").map do |char|
      if char >= "A" && char <= "Z"
        (((char.ord - "A".ord + 1 + @shift) % 26) + 64).chr
      elsif char >= "a" && char <= "z"
        (((char.ord - "a".ord + 1 + @shift) % 26) + 96).chr
      else
        char
      end
    end
  
    # Join array and return string
    @cipher = @cipher.join
  end

  def output
    print "Your encrypted message is: "
    print "#{@cipher}\n"
  end
end

Cipher.new.run_cipher