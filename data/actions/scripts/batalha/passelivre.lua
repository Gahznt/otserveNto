domodlib('task_func')
function onUse(cid, item, fromPos, itemEx, toPos)
	if getTaskPoints(cid) <= 69 then
		doPlayerSendTextMessage(cid,22,"Você ganhou + 5 Ponto de Missão")	
		setPlayerStorageValue(cid, task_sys_storages[2], (getTaskPoints(cid)+5))
	else
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você atingiu o seu limite.")
	end
    return true
end