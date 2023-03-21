function onUse(cid, item, frompos, item2, topos)

if getPlayerStorageValue(cid, 18101) < 1 then
doPlayerSendTextMessage(cid,22,"Você encontrou novos items !")
local bag = doPlayerAddItem(cid, 1987, 1)
doAddContainerItem(bag, 9633, 1)
setPlayerStorageValue(cid, 18101, 1)
else
doSendMagicEffect(getPlayerPosition(cid), 3) -- Puff
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Não há nada para você aqui.")
end

return TRUE
end