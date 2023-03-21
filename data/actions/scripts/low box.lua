local items = {
{itemId = 2160, count = 50, chance = 40}, -- ITEM, QUANTIDADE, CHANCE
{itemId = 11255, count = 25, chance = 40},
{itemId = 9004, count = 1, chance = 20},
{itemId = 2193, count = 1, chance = 20},
}

function onUse(cid, item, frompos, item2, topos)

local config = {
	pos = getCreaturePosition(cid), -- posição do player
	exhaustionSeconds = 3600, -- exausted em segundos
	storageUse = 43331, -- storage usado.

}

if(exhaustion.check(cid, config.storageUse)) then
if (exhaustion.get(cid, config.storageUse) >= 60) then
doPlayerSendCancel(cid, "Você somente poderá abrir uma nova Rare Box em " .. math.floor(exhaustion.get(cid, config.storageUse) / 60 + 1) .." minutos.") 
end
if (exhaustion.get(cid, config.storageUse) <= 60) then
doPlayerSendCancel(cid, "Você precisa esperar " .. exhaustion.get(cid, config.storageUse).." segundos.")
end
return true
end

    local totalChance, randomTable, randomNumber = 0, {}, 0
	
	addEvent(doPlayerSendTextMessage, 1*1000, cid, 27, "Sorteando...")
    addEvent(doPlayerSendTextMessage, 2*1000, cid, 27, "Sorteando...")
	addEvent(doPlayerSendTextMessage, 3*1000, cid, 27, "Sorteando...")
	addEvent(doPlayerSendTextMessage, 4*1000, cid, 27, "Sorteando...")
	addEvent(doPlayerSendTextMessage, 5*1000, cid, 27, "Sorteando...")
	addEvent(doSendAnimatedText, 1*1000, config.pos, "[5]", 180)
    addEvent(doSendAnimatedText, 2*1000, config.pos, "[4]", 180)
	addEvent(doSendAnimatedText, 3*1000, config.pos, "[3]", 180)
	addEvent(doSendAnimatedText, 4*1000, config.pos, "[2]", 180)
	addEvent(doSendAnimatedText, 5*1000, config.pos, "[1]", 180)
	addEvent(doSendAnimatedText, 6*1000, config.pos, "Pronto!", 180)
	
    for _, itemInfo in pairs (items) do
            randomTable[itemInfo.itemId] = {min = totalChance + 1, max = itemInfo.chance, count = itemInfo.count or 1}
            totalChance = totalChance + itemInfo.chance
    end
    
    randomNumber = math.random(1, totalChance)
    
    for itemId, itemInfo in pairs (randomTable) do
            local min, max = itemInfo.min, itemInfo.min + itemInfo.max
            if randomNumber >= min and randomNumber <= max then
                    local newItem = addEvent(doPlayerAddItem, 6*1000, cid, itemId, itemInfo.count, false)
                    if not newItem then return doPlayerSendCancel(cid, "Você não possui espaço suficiente para receber o item.") end
                    doRemoveItem(item.uid, 1)
					exhaustion.set(cid, config.storageUse, config.exhaustionSeconds)
                    local iInfo = getItemInfo(itemId)
                    addEvent(doPlayerSendTextMessage, 6*1000, cid, 27, "Item encontrado : (" ..iInfo.name.. ")!")
                    break
            end
    end

return true
end