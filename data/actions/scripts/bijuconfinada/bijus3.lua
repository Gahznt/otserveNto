function onUse(cid, item, frompos, item2, topos)
local position1 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}

local stor = 52203

local tile = 75552

if getPlayerStorageValue(cid, stor) < 1 then
doPlayerPopupFYI(cid, "Parabens, Voce derrotou [3] das [9] Bijus !")
doSendMagicEffect(position1, 36)
-- doPlayerAddExp(cid, 5000000)
doPlayerAddItem(cid, 2160, 3)
setPlayerStorageValue(cid, stor, 1)
setPlayerStorageValue(cid, tile, 1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou essa recompensa.")
end

return TRUE
end