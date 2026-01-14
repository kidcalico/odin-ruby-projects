class Board
  attr_accessor :feedback

  def feedback(code, guess)
    @code_arr = code.join.split('')
    @guess_arr = guess.join.split('')

    @feedback = %w[X X X X]

    @guess_arr.each_index do |i|
      next unless @guess_arr[i] == @code_arr[i]

      @guess_arr[i] = 'X'
      @code_arr[i] = 'X'
      @feedback[i] = 'R'
    end

    @guess_arr.each_index do |i|
      next unless (@guess_arr[i] != 'X') && @code_arr.include?(@guess_arr[i])

      @code_arr[@code_arr.index(@guess_arr[i])] = 'X'
      @guess_arr[i] = 'X'
      @feedback[i] = 'W'
    end

    @feedback
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
        print 'O'.colorize(:red).on_yellow
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
    print "\n\n"
  end
end
