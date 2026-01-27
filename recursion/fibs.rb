def fibs(num)
  seq = []
  (0..num-1).each do |var|
    seq << var if var < 2
    seq << seq[var - 1] + seq[var - 2] if var >= 2
  end
  seq
end

def fibs_rec(num, seq = [])
  if num == 1
    seq << 0
  elsif num == 2
    fibs_rec(num-1, seq)
    seq << 1
  else
    fibs_rec(num-1, seq)
    seq << seq[-1] + seq[-2]
  end

  return seq
end

# def fibs_rec_v2(num)
#   seq =[]
#   if num == 1
#     seq << 0
#   elsif num == 2
#     seq << 1
#   else
#     seq << fibs_rec_v2(num-1) + fibs_rec_v2(num-2)
#   end
# end

x = 9
# puts "Recursive function: #{fibs_rec_v2(x)}"
puts "Recursive function: #{fibs_rec(x)}"
puts "Looping function: #{fibs(x)}"