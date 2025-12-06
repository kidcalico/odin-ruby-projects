def bubble_sort(arr)
  # Define initial variables for array length and whether swapped
  n = arr.length
  swapped = nil

  # Compare each element with it's preceding element, switching places
  # when the one before is greater than the one after. Continue loop
  # until no values need to be swapped. Return the modified array.

  while swapped != false do
    swapped = false
    for i in 1..n-1
      if arr[i - 1] > arr[i]
        arr[i - 1], arr[i] = arr[i], arr[i - 1]
        swapped = true
      end
    end
  end

  arr

end

# Generate an array of 20 numbers between 0 and 100 to be used in
# bubble_sort method.

to_sort = []
20.times { to_sort << rand(100) }

p bubble_sort(to_sort)