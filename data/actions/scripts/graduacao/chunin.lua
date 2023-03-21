domodlib('task_func')

local amount = 40
local hp = 2000
local stor = 12332
local level = 60

function onUse(cid, item, fromPosition, itemEx, toPosition)
if getPlayerLevel(cid) >= level then	
	if getTaskPoints(cid) >= amount and getPlayerStorageValue(cid, stor) < 1 then
		local bag = doPlayerAddItem(cid, 1999, 1)
		doAddContainerItem(bag, 2160, 40)
		doAddContainerItem(bag, 11255, 10)
		doAddContainerItem(bag, 2168, 100)
		doAddContainerItem(bag, 7588, 100)
		doAddContainerItem(bag, 7589, 100)
		
		setCreatureMaxHealth(cid, getCreatureMaxHealth(cid)+hp)
		doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
		doPlayerSendTextMessage(cid,22,"Parabéns, você recebeu uma recompensa chunin !")
		setPlayerStorageValue(cid,stor,1)
		doRemoveItem(item.uid, 1)
	elseif getPlayerStorageValue(cid, stor) >= 1 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você já abriu um presente como esse.")
	else
		doSendMagicEffect(getPlayerPosition(cid), 3) -- Puff
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você precisa ser graduado como Chunin para pegar abrir esse presente.")
	end
else	
doSendMagicEffect(getPlayerPosition(cid), 3) -- Puff
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você precisa do level 60+ para abrir este presente.")
end
return TRUE
end