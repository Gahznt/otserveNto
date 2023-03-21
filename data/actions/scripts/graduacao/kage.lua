domodlib('task_func')

local amount = 100
local hp = 4000
local stor = 12134
local level = 100

function onUse(cid, item, fromPosition, itemEx, toPosition)
if getPlayerLevel(cid) >= level then
	if getTaskPoints(cid) >= amount and getPlayerStorageValue(cid, stor) < 1 then
		local bag = doPlayerAddItem(cid, 1999, 1)
		doAddContainerItem(bag, 2160, 100)
		doAddContainerItem(bag, 11255, 100)
		doAddContainerItem(bag, 8981, 1)
		setCreatureMaxHealth(cid, getCreatureMaxHealth(cid)+hp)
		doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
		doPlayerSendTextMessage(cid,22,"Parabéns, você recebeu uma recompensa kage !")
		setPlayerStorageValue(cid,stor,1)
		doRemoveItem(item.uid, 1)
		doSendMagicEffect(getPlayerPosition(cid), 492)
	elseif getPlayerStorageValue(cid, stor) >= 1 then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você já abriu um presente como esse.")
	else
		doSendMagicEffect(getPlayerPosition(cid), 3) -- Puff
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você precisa ser graduado como Kage para pegar abrir esse presente.")
	end
else	
doSendMagicEffect(getPlayerPosition(cid), 3) -- Puff
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você precisa do level 100+ para abrir este presente.")
end
return TRUE
end