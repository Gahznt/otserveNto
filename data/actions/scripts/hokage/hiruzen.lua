domodlib('task_func')
function onUse(cid, item, frompos, item2, topos)
local position1 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
local amount = 100
	if getTaskPoints(cid) >= amount and getPlayerStorageValue(cid, 13551) < 1 then
		doPlayerAddItem(cid,2220,1)
		doPlayerSendTextMessage(cid,22,"Você ganhou um Scroll do personagem Hiruzen")
		doSendMagicEffect(position1, 5)
		setPlayerStorageValue(cid, 13551, 1)
		elseif getPlayerStorageValue(cid, 13443) >= 1 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você já pegou seu personagem.")
	else
	doSendMagicEffect(getPlayerPosition(cid), 3) -- Puff
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você precisa ser graduado como Kage para pegar o personagem.")
end

return TRUE
end