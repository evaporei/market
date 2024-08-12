local Player = require('player')

local p1 = Player.new(2000, {
    { id = 'fuel', price = 50, quantity = 60 },
    { id = 'sugar', price = 5, quantity = 100 },
    { id = 'banana', price = 2, quantity = 20 },
})

local p2 = Player.new(1000, {
    { id = 'fuel', price = 40, quantity = 30 },
    { id = 'sugar', price = 4, quantity = 50 },
    { id = 'tomatoes', price = 6, quantity = 33 },
})

print('p1', tostring(p1))
print('p2', tostring(p2))

print('p1 buys 10 fuel for $20')
assert(p1:buy(p2, { id = 'fuel', price = 20, quantity = 10 }))

print('p1', tostring(p1))
print('p2', tostring(p2))

print('p2 sells 13 sugar for $3')
assert(p2:sell(p1, { id = 'sugar', price = 3, quantity = 13 }))

print('p1', tostring(p1))
print('p2', tostring(p2))
