# The Odin Project: Stock Picker

Create a method which processes an array of numbers, representing the 
prices of stocks on consecutive days, and returns the best day to buy
and the best day to sell, allowing for maximum profit. (The sell must
occur after the buy.)

This mini project was a bit puzzling at first. Thought there are
probably better solutions, I think I found a good one: If the lowest
price occurs before the highest price, it returns those two prices. If,
however, the lowest price occurs *after* the highest price, the array
is split in two, and the profit margins are compared, and the pair with
the highest profit margin is returned. It's possible that the min and a
number other than the global max could still return a higher profit
margin. I haven't tested this with too many arrays so it could still be
buggy but it fits the project brief.