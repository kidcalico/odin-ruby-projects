def merge_sort(array)
  return array if array.length == 1
  a = array[0...array.length/2]
  b = array[array.length/2..-1]
  
  a = merge_sort(a)
  p a
  b = merge_sort(b)
  p b
  
  c = []

  for i in (0..array.length-1) do
    if a == []
      c << b.shift
    elsif b == []
      c << a.shift
    elsif a[0] < b[0]
      c << a.shift
    else
      c << b.shift
    end
  end

  # i = 0
  # j = 0
  # k = 0
  
  # m = a.length
  # n = b.length
  
  # while(i < m && j < n) do
  #   if a[i] < b[j]
  #     c[k] = a[i]
  #     i += 1
  #   else
  #     c[k] = b[j]
  #     j += 1
  #   end
  #   k += 1
  # end

  # while i < m do
  #   c[k] = a[i]
  #   k += 1
  #   i += 1
  # end

  # while j < n do
  #   c[k] = b[j]
  #   k += 1
  #   j += 1
  # end

  return c
end

arr = [7, 4, 99, 54, 5, 11, 10, 4, 20, 61, 21]
# arr = []
# 11.times { arr << rand(100)+1 }
puts "Orig: #{arr}"
print merge_sort(arr)