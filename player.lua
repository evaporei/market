local Market = require('market')

local Player = {}
Player.__index = Player

function Player.new(balance, resources)
    local self = {}

    self.market = Market.new(balance, resources)

    setmetatable(self, Player)
    return self
end

function Player:buy(p2, resource)
    return p2.market:canSell(resource) and
        self.market:canBuy(resource) and
        p2.market:sell(resource) and
        self.market:buy(resource)
end

function Player:sell(p2, resource)
    return p2.market:canBuy(resource) and
        self.market:canSell(resource) and
        p2.market:buy(resource) and
        self.market:sell(resource)
end

function Player:__tostring()
    return tostring(self.market)
end

return Player
