domodlib('task_func')
function onUse(cid, item, frompos, item2, topos)
local position1 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
local amount = 100
	if getTaskPoints(cid) >= amount then
		if getPlayerStorageValue(cid, 15305) < 1 then
			doPlayerAddItem(cid,10584,1)
			doPlayerSendTextMessage(cid,22,"Você pegou o Certificado Kage")
			doSendMagicEffect(position1, 5)
			setPlayerStorageValue(cid, 15305, 1)
		else
			doSendMagicEffect(getPlayerPosition(cid), 3) -- Puff
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você já pegou o certificado")
		end
	else
		doSendMagicEffect(getPlayerPosition(cid), 3) -- Puff
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você precisa ser graduado como Kage para pegar o certificado.")
end

return TRUE
end