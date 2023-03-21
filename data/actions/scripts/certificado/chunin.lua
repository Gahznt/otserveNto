domodlib('task_func')
function onUse(cid, item, frompos, item2, topos)
local position1 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
local amount = 40
	if getTaskPoints(cid) >= amount and getPlayerStorageValue(cid, 12602) < 1 then
		doPlayerAddItem(cid,10582,1)
		doPlayerSendTextMessage(cid,22,"Você pegou o Certificado Chunin")
		doSendMagicEffect(position1, 5)
		setPlayerStorageValue(cid, 12602, 1)
		elseif getPlayerStorageValue(cid, 12602) >= 1 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você já pegou seu certificado.")
	else
	doSendMagicEffect(getPlayerPosition(cid), 3) -- Puff
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você precisa ser graduado como Chunin para pegar o certificado.")
end

return TRUE
end