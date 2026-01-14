class Board
  def feedback(code, guess)
    @code_arr = code.join.split('')
    @guess_arr = guess.join.split('')

    @feedback = %w[X X X X]

    reds
    whites

    @feedback
  end

  def reds
    @guess_arr.each_index do |i|
      next unless @guess_arr[i] == @code_arr[i]

      @guess_arr[i] = 'X'
      @code_arr[i] = 'X'
      @feedback[i] = 'R'
    end
  end

  def whites
    @guess_arr.each_index do |i|
      next unless (@guess_arr[i] != 'X') && @code_arr.include?(@guess_arr[i])

      @code_arr[@code_arr.index(@guess_arr[i])] = 'X'
      @guess_arr[i] = 'X'
      @feedback[i] = 'W'
    end
  end

  def correct?(code, guess)
    code == guess
  end

  def color(guess)
    arr = guess.split('')
    arr.each do |g|
      print 'R'.colorize(:red) if g == 'R'
      print 'O'.colorize(:red).on_yellow if g == 'O'
      print 'Y'.colorize(:yellow) if g == 'Y'
      print 'G'.colorize(:green) if g == 'G'
      print 'B'.colorize(:blue) if g == 'B'
      print 'P'.colorize(:magenta) if g == 'P'
    end
    print "\n\n"
  end
end
