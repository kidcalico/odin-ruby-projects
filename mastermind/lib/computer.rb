# frozen_string_literal: true

class Computer
  attr_reader :code, :color

  def guess
    @guess
  end

  def set_code
    # code = ['B', 'P', 'Y', 'Y']
    code = []
    4.times { code.push(rand_color) }
    code.join
  end

  def rand_color
    COLORS[rand(6)]
  end
end
