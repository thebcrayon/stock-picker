def stock_picker(days_array)
  # set initial values
  highest_profit = 0
  best_buy = 0
  best_sell = 0

  # Gets us each price of the array as a buying price
  days_array.each_with_index do |buy_price, idx|
    
    # Gives us selling possibilities from only current index forward
    days_array[idx..days_array.size].each_with_index do |sell_price, sell_index|
      
      # Track current profit and change it if necessary
      current_profit = sell_price - buy_price
      if current_profit > highest_profit
        highest_profit = current_profit
        best_buy = idx
        best_sell = sell_index + idx # Needs to reference index in context of days_array
      end
    end
  end

  # Implicit return
  # best_buy best_sell are storing indexes in reference to original days_array
  "Buying at $#{days_array[best_buy]} and selling at $#{days_array[best_sell]} will yield the highest profit of $#{days_array[best_sell] - days_array[best_buy]}"

end

puts stock_picker([17,3,6,9,15,8,6,1,10])