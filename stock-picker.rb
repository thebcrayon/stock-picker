def stock_picker(days)
  optimized = []
  highest_profit = 0
 
  # build up hash of options available each day
  # When checking for the profit possiblities on day 4,
  # days 1 - 3 should not be considered for max profit
  # => {0 => [0..n], 1 => [1..n], 2 => [2..n], etc.}
  # storing original index as keys here is convenient for accessing them later
  days_hash = days.each_with_index.reduce(Hash.new(0)) do |result, (price, index)| 
    result[index] = days.slice(index,days.size)
    result
  end

  days_hash.each do |key, value|
    curr_profit = get_max_profit_from_day_set(value)
    if curr_profit > highest_profit
      highest_profit = curr_profit
      optimized = [key, days.find_index(highest_profit + days[key])]
    end
  end
  optimized
end

def get_max_profit_from_day_set(day_set)
  curr_profit = 0
  buy_price = day_set[0]
  day_set.each do |price|
    day_set.size.times do |index|
      curr_total = day_set[index] - buy_price
        if (curr_profit < curr_total)
            curr_profit = curr_total
        end
      end
  end
 curr_profit
end

p stock_picker([17,3,6,9,15,8,6,1,10])
