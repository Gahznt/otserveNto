domodlib('task_func')
function onUse(cid, item, frompos, item2, topos)
local position1 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
if getPlayerStorageValue(cid, 11813) < 1 then
local bag = doPlayerAddItem(cid, 1987, 1)
doAddContainerItem(bag, 7869, 1)
doPlayerAddExp(cid, 175000)
doPlayerSendTextMessage(cid, 22, "Parabéns, você encontrou uma Zabuza Sword !")
doSendMagicEffect(position1, 186)
setPlayerStorageValue(cid, 11813, 1)
doPlayerSendTextMessage(cid,22,"Você ganhou + 1 Ponto de Graduação")	
setPlayerStorageValue(cid, task_sys_storages[2], (getTaskPoints(cid)+1))
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Não há nada para você aqui.")
end

return TRUE
end