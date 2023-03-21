function onUse(cid, item, frompos, item2, topos)
local position1 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
if getPlayerStorageValue(cid, 11601) < 1 then
local bag = doPlayerAddItem(cid, 1987, 1)
doAddContainerItem(bag, 11322, 1) -- DANZOU

 doPlayerPopupFYI(cid, "Obrigado por participar do Test Server : Você recebeu Susano Arch!" )
doSendMagicEffect(position1, 186)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Não há nada para você aqui.")
end

return TRUE
end