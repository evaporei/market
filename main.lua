local Market = require('market')

local market = Market.new(1000, {
    { id = 'fuel', price = 50, quantity = 100 },
    { id = 'sugar', price = 10, quantity = 70 },
})

print(tostring(market))

-- existing resource
print('buy fuel', market:buy({ id = 'fuel', price = 40, quantity = 5 }))
print(tostring(market))
print('sell fuel', market:sell({ id = 'fuel', price = 50, quantity = 5 }))
print(tostring(market))

-- too much (not enough cash)
print('buy fuel (fail)', market:buy({ id = 'fuel', price = 50, quantity = 50000 }))
print(tostring(market))

-- new resource
print('buy banana', market:buy({ id = 'banana', price = 2, quantity = 100 }))
print(tostring(market))

-- too many (not enough bananas)
print('sell banana (fail)', market:sell({ id = 'banana', price = 50, quantity = 50000 }))
print(tostring(market))

-- non existing resource
print('sell tomatoes (fail)', market:sell({ id = 'tomatoes', price = 50, quantity = 50000 }))
print(tostring(market))

-- sell all of a resource
print('sell all bananas', market:sell({ id = 'banana', price = 2, quantity = 100 }))
print(tostring(market))
