stocks = [17,6,9,20,8,6,1,16]

def stock_picker(arr)

  # Remove edge cases
  if arr.index(arr.max) == 0
    arr.shift
  end
  if arr.index(arr.min) == -1
    arr.pop
  end

  # If the smallest number occurs after the largest number, split the
  # array and test both sides, to test for the greatest discrepancy,
  # and return the correct pair, otherwise return the min and max from
  # the original array.
  if arr.index(arr.min) > arr.index(arr.max)
    first_arr = arr.slice(0..(arr.index(arr.max)))
    second_arr = arr.slice((arr.index(arr.min))..-1)
    if (first_arr.max - first_arr.min) > (second_arr.max - second_arr.min)
      return [first_arr.index(first_arr.min), first_arr.index(first_arr.max)]
    else
      return [second_arr.index(second_arr.min), second_arr.index(second_arr.max)]
    end
  else
    return [arr.index(arr.min), arr.index(arr.max)]
  end
end

p stock_picker(stocks)