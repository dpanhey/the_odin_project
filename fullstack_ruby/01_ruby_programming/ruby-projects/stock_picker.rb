# nehme x an position a
#   prüfe ob y an position b > position x an a ist
#     berechne ob y an position b - x an position a > profit
#       wenn ja => profit = y[b] - x[a]


def stock_picker(stock_prices)
  profit = 0;
  day_pair = [];
  stock_prices.each.with_index do |x, a|
    stock_prices.each.with_index do |y, b|
      unless b > a && (y - x) > profit
        next
      else
        profit = y - x
        day_pair = [a, b]
      end
    end
  end
  return day_pair
end

stock_prices_1 = [17,3,6,9,15,8,6,1,10]
stock_prices_2 = [5,6,19,23,2,1,15,7,2]
stock_prices_3 = [1,5,12,3,6,8,19,2,9,14]
stock_prices_4 = [8,5,8,3,2,12,6,1,15,2]
p stock_picker(stock_prices_1)
# => [1, 4] # for a profit of $15 - $3 == $12
p stock_picker(stock_prices_2)
# => [0, 3]
p stock_picker(stock_prices_3)
# => [0, 6]
p stock_picker(stock_prices_4)
# => [0, 8]