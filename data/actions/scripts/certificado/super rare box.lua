domodlib('task_func')
function onUse(cid, item, frompos, item2, topos)
local position1 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
local amount = 150
	if getTaskPoints(cid) >= amount then
		if getPlayerItemCount(cid, 11329) >= 250 then
			if getPlayerStorageValue(cid, 14466) < 1 then
				doPlayerAddItem(cid,6549,1)
				doPlayerRemoveItem(cid, 11329, 250)
				doPlayerSendTextMessage(cid,22,"Você ganhou uma Super Rare Box")
				doSendMagicEffect(position1, 5)
				setPlayerStorageValue(cid, 14466, 1)
			else
				doSendMagicEffect(getPlayerPosition(cid), 3) -- Puff
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você já pegou sua Super Rare Box")
			end
			
		else
		doSendMagicEffect(getPlayerPosition(cid), 3) -- Puff
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você precisa de 250 Crystal of Victory Essence.")
	end	
	else
		doSendMagicEffect(getPlayerPosition(cid), 3) -- Puff
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você precisa de 150 Pontos de Graduação.")
end

return TRUE
end