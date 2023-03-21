domodlib('task_func')
function onUse(cid, item, frompos, item2, topos)
local position1 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
if getPlayerStorageValue(cid, 11205) < 1 then
local bag = doPlayerAddItem(cid, 1987, 1)
doAddContainerItem(bag, 124, 1)
doAddContainerItem(bag, 7463, 1)
doAddContainerItem(bag, 11475, 1)
doAddContainerItem(bag, 123, 1)
doAddContainerItem(bag, 7588, 250) -- Pot
doAddContainerItem(bag, 7589, 250) -- Pot

doPlayerAddExp(cid, 117700)
doPlayerSendTextMessage(cid, 22, "Parabéns, você completou a Quest Set Saga Nível ( 5 )!")
doSendMagicEffect(position1, 186)
setPlayerStorageValue(cid, 11205, 1)
doPlayerSendTextMessage(cid,22,"Você ganhou + 1 Ponto de Graduação")	
setPlayerStorageValue(cid, task_sys_storages[2], (getTaskPoints(cid)+1))
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Não há nada para você aqui.")
end

return TRUE
end