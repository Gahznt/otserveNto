function onUse(cid, item, frompos, item2, topos)
local position1 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
if getPlayerStorageValue(cid, 11731) < 1 then
local bag = doPlayerAddItem(cid, 1987, 1)
doAddContainerItem(bag, 2456, 1)
doAddContainerItem(bag, 2479, 1)
doAddContainerItem(bag, 2473, 1)
doAddContainerItem(bag, 2474, 1)
doPlayerPopupFYI(cid, "Obrigado por participar do Test Server : Você recebeu um Set Saga Nivel ( 8 )!")
doSendMagicEffect(position1, 186)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Não há nada para você aqui.")
end
return TRUE
end