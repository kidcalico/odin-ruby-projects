def merge_sort(array)
  return array if array.length == 1
  a = merge_sort(array[0...array.length/2])
  b = merge_sort(array[array.length/2..-1])
  merged = []

  for i in (0..array.length-1) do
    case
    when a == [] then merged << b.shift
    when b == [] then merged << a.shift
    when a[0] < b[0] then merged << a.shift
    else merged << b.shift
    end
  end

  return merged
end

arr = []
x = rand(20) + 1
x.times { arr << rand(100)+1 }
puts "Original array: #{arr}"
print "Sorted array: #{merge_sort(arr)}"