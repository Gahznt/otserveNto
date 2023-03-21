domodlib('task_func')
function onUse(cid, item, frompos, item2, topos)
local position1 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
if getPlayerStorageValue(cid, 31104) < 1 then
doPlayerAddItem(cid, 6548, 1)
doPlayerAddExp(cid, 117700)
doPlayerSendTextMessage(cid, 22, "Parabéns, você completou a Quest Rare Box!")
doSendMagicEffect(position1, 186)
setPlayerStorageValue(cid, 31104, 1)
doPlayerSendTextMessage(cid,22,"Você ganhou + 1 Ponto de Graduação")	
setPlayerStorageValue(cid, task_sys_storages[2], (getTaskPoints(cid)+1))
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Não há nada para você aqui.")
end

return TRUE
end