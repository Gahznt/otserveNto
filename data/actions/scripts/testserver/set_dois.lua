function onUse(cid, item, frompos, item2, topos)
local position1 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
if getPlayerStorageValue(cid, 11731) < 1 then
local bag = doPlayerAddItem(cid, 1987, 1)
doAddContainerItem(bag, 2647, 1)
doAddContainerItem(bag, 7407, 1)
doAddContainerItem(bag, 7454, 1)
doAddContainerItem(bag, 122, 1)
doPlayerPopupFYI(cid, "Obrigado por participar do Test Server : Você recebeu um Set Saga Nivel ( 2 )!")
doSendMagicEffect(position1, 186)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Não há nada para você aqui.")
end
return TRUE
end