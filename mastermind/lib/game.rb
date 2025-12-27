module Mastermind
  COLORS = %w[R O Y G B P]

  class Game
    def initialize(codemaker, codebreaker)
      @player = [codemaker.new, codebreaker.new]
    end

    attr_reader :code_maker_id, :code_breaker_id, :player, :code
    attr_accessor :guess

    def play
      @code = @player[0].set_code
      puts 'Computer has set the code.'
      puts 'Color choices: [R]ed, [O]range, [Y]ellow, [G]reen, [B]lue [P]urple, '
      @count = 0
      12.times do
        @guess = @player[1].guess
        if correct?(@code, @guess)
          puts 'You win! Great job guessing the correct code!'
          puts "Code: #{@code}"
          break
        else
          feedback(@code, @guess)
        end
        @count += 1
        puts "#{12 - @count} guesses remain."
      end
      return unless @count == 12 && correct?(@code, @guess) == false

      puts "Too bad, the correct code was #{code}. Try again!"
    end

    def guess
      gets.chomp
    end

    def feedback(code, guess)
      @code_arr = code.split('')
      @guess_arr = guess.split('')

      @feedback = []
      @guess_arr.each_with_index do |g, i|
        next unless g == @code_arr[i]

        @feedback << 'R'
        @code_arr[i] = 'X'
        @guess_arr[i] = 'X'
      end

      @guess_arr.each_with_index do |g, i|
        if g == 'X'
          next
        elsif @code_arr.include?(g)
          @feedback << 'W'
          @code_arr[@code_arr.index(g)] = 'X'
          @guess_arr[i] = 'X'
        end
      end
      print 'Your guess: '
      color(@guess)
      puts "Feedback: #{@feedback.shuffle.join}"
    end

    def correct?(code, guess)
      code == guess
    end

    def color(guess)
      arr = guess.split('')
      arr.each do |g|
        if g == 'R'
          print 'R'.colorize(:red)
        elsif g == 'O'
          print 'O'.colorize(:yellow).on_red
        elsif g == 'Y'
          print 'Y'.colorize(:yellow)
        elsif g == 'G'
          print 'G'.colorize(:green)
        elsif g == 'B'
          print 'B'.colorize(:blue)
        elsif g == 'P'
          print 'P'.colorize(:magenta)
        end
      end
      print "\n"
    end
  end
end
