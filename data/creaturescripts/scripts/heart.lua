function onDeath(cid, corpse, deathList)

if getPlayerIp(cid) == getPlayerIp(deathList[1]) then return true end

function getHeartFromNivel(cid)

local t = {

[{60,99}] = 2519, -- Brave Heart

[{100,math.huge}] = 2520 -- Glorious Heart

}


for var, ret in pairs(t) do


if getPlayerLevel(cid) >= var[1] and getPlayerLevel(cid) <= var[2] then

k  = ret

end

end

return k

end


if isPlayer(cid) and getPlayerLevel(cid) >= 60 and isPlayer(deathList[1]) then

local item = getHeartFromNivel(cid)

doItemSetAttribute(doPlayerAddItem(deathList[1],item, 1), "description", "Coração do Shinobi "..getPlayerName(cid).." assassinado no level "..getPlayerLevel(cid).." por "..getPlayerName(deathList[1])..".")

if getPlayerLevel(cid) >= 100 and getPlayerLevel(cid) <= 1000 then

doBroadcastMessage("".. getCreatureName(deathList[1]) .. " [" .. getPlayerLevel(deathList[1]) .. "] Assassinou Lindamente o Glorioso Shinobi " .. getCreatureName(cid) .. " [" .. getPlayerLevel(cid) .. "]",18)

end

doSendMagicEffect(getPlayerPosition(deathList[1]), 12)

end

return true

end