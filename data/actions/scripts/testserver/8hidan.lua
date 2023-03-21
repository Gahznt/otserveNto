function onUse(cid, item, frompos, item2, topos)
local position1 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
if getPlayerStorageValue(cid, 17735) < 1 then
local bag = doPlayerAddItem(cid, 1987, 1)
doAddContainerItem(bag, 2519, 5)
doPlayerSendTextMessage(cid, 22, "Obrigado por participar do Test Server : Você recebeu Item Ou Permissão para realizar uma missão!" )
doSendMagicEffect(position1, 186)

else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Não há nada para você aqui.")
end

return TRUE
end