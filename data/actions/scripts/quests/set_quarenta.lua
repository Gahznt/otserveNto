domodlib('task_func')
function onUse(cid, item, frompos, item2, topos)
local position1 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
if getPlayerStorageValue(cid, 11204) < 1 then
local bag = doPlayerAddItem(cid, 1987, 1)
doAddContainerItem(bag, 126, 1)
doAddContainerItem(bag, 7453, 1)
doAddContainerItem(bag, 2429, 1)
doAddContainerItem(bag, 2161, 1)
doAddContainerItem(bag, 7588, 100) -- Pot
doAddContainerItem(bag, 7589, 100) -- Pot
doPlayerAddExp(cid, 74200)
doPlayerSendTextMessage(cid, 22, "Parabéns, você completou a Quest Set Saga Nível ( 4 )!")
doSendMagicEffect(position1, 186)
setPlayerStorageValue(cid, 11204, 1)
doPlayerSendTextMessage(cid,22,"Você ganhou + 1 Ponto de Graduação")	
setPlayerStorageValue(cid, task_sys_storages[2], (getTaskPoints(cid)+1))
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Não há nada para você aqui.")
end

return TRUE
end