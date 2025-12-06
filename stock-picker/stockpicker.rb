# stocks = [17,3,6,9,15,8,6,1,10]

# Generate an array of ten random integers between 0 and 20 to be used
# as stock prices:
stocks = []
10.times {|i| stocks.push(rand(20))}
p stocks

def stock_picker(arr)

  max_profit = 0
  buy_sell = []

  # For each value in the array, find the maximum difference in values
  # for each of the following values in the array. Store maximums and
  # their indexes in predefined variables, and return those values 
  # after cycling through all possibilities

  # Third attempt, using each_with_index. So far this is my favorite solution.

  arr.each_with_index do |max_price, max_index|
    arr.each_with_index do |min_price, min_index|
      if min_index < max_index
        profit = max_price - min_price
        if profit > max_profit
          max_profit = profit
          buy_sell = [min_index, max_index]
        end
      end
    end
  end

  # Second solution, using for loops
  # for i in 0..arr.length-1
  #   for j in i+1..arr.length-1
  #     diff = arr[j] - arr[i]
  #     if diff > max_profit
  #       max_profit = diff
  #       buy_sell = [i, j]
  #     end
  #   end
  # end

  puts "Maximum profit: #{max_profit}"
  puts "Days to buy and sell: #{buy_sell}"

end

stock_picker(stocks)