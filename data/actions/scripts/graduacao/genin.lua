domodlib('task_func')

local amount = 20
local hp = 1000
local stor = 13441
local level = 40

function onUse(cid, item, fromPosition, itemEx, toPosition)
if getPlayerLevel(cid) >= level then	
	if getTaskPoints(cid) >= amount and getPlayerStorageValue(cid, stor) < 1 then
		local bag = doPlayerAddItem(cid, 1999, 1)
		doAddContainerItem(bag, 2160, 20)
		doAddContainerItem(bag, 11255, 5)
		doAddContainerItem(bag, 3964, 100)
		doAddContainerItem(bag, 7588, 50)
		doAddContainerItem(bag, 7589, 50)
		setCreatureMaxHealth(cid, getCreatureMaxHealth(cid)+hp)
		doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
		doPlayerSendTextMessage(cid,22,"Parabéns, você recebeu uma recompensa genin !")
		setPlayerStorageValue(cid,stor,1)
		doRemoveItem(item.uid, 1)
	elseif getPlayerStorageValue(cid, stor) >= 1 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você já abriu um presente como esse.")
	else
		doSendMagicEffect(getPlayerPosition(cid), 3) -- Puff
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você precisa ser graduado como Genin para pegar abrir esse presente.")
	end
else
doSendMagicEffect(getPlayerPosition(cid), 3) -- Puff
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você precisa do level 40+ para abrir este presente.")
end
return TRUE
end