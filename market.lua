local Market = {}
Market.__index = Market

function Market.new(balance, resources)
    local self = {}

    self.balance = balance or 0
    self.resources = resources or {}

    setmetatable(self, Market)
    return self
end

function Market:buy(resource)
    local i = -1
    for k, r in pairs(self.resources) do
        if r.id == resource.id then
            i = k
            break
        end
    end
    -- not found, insert
    if i == -1 then
        table.insert(self.resources, { id = resource.id, price = resource.price, quantity = 0 })
        i = #self.resources
    end
    local newBalance = self.balance - resource.quantity * resource.price
    if newBalance < 0 then
        return false
    else
        self.resources[i].quantity = self.resources[i].quantity + resource.quantity
        self.resources[i].price = resource.price
        self.balance = newBalance
        return true
    end
end

function Market:sell(resource)
    local i = -1
    for k, r in pairs(self.resources) do
        if r.id == resource.id then
            i = k
            break
        end
    end

    -- resource not found
    if i == -1 then
        return false
    end
    local newQty = self.resources[i].quantity - resource.quantity
    if newQty < 0 then
        return false
    end
    self.resources[i].quantity = newQty
    if newQty == 0 then
        table.remove(self.resources, i)
    end
    self.balance = self.balance + resource.quantity * resource.price
    return true
end

function Market:__tostring()
    local resources = ''
    for _, r in pairs(self.resources) do
        local resource = '\t{ id = ' .. tostring(r.id) .. ', price = ' .. tostring(r.price) .. ', quantity = ' .. tostring(r.quantity) .. ' }, \n'
        resources = resources .. resource
    end
    return '{ balance = ' .. tostring(self.balance) .. ', resources = { \n' .. resources .. ' } }'
end

return Market
