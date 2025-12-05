stocks = [17,3,6,9,15,8,6,1,14]

def stock_picker(arr)

  max_profit = 0
  buy_sell = []

  # For each value in the array, find the maximum difference in values
  # for each of the following values in the array. Store maximums and
  # their indexes in predefined variables, and return those values 
  # after cycling through all possibilities

  for i in 0..arr.length-1
    for j in i+1..arr.length-1
      diff = arr[j] - arr[i]
      if diff > max_profit
        max_profit = diff
        buy_sell = [i, j]
      end
    end
  end

  puts "Maximum profit: #{max_profit}"
  puts "Days to buy and sell: #{buy_sell}"

end

stock_picker(stocks)