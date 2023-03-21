local config = {
itemid = 2543, -- id da bomba 
duration = 30, -- duration antes de ser removida
actionid = 13245, -- actionid que sera setado na bomba (pro movements)
effect = 3, -- efeito que sai ao colocar a bomba
msg = "Explosive Paper" -- mensagem que sai ao ser colocado a bomba
}

function removeBomba(pos, id)
local item = getTileItemById(pos, id)
	if item.uid > 0 then
		doRemoveItem(item.uid)
	end
return true
end

function onCastSpell(cid, var)
	local position = getCreaturePosition(cid)
	local item = doCreateItem(config.itemid, 1, position)
	setItemAid(item, config.actionid)
	doItemSetAttribute(item, 'ref', getCreatureName(cid))
	doCreatureSay(cid, config.msg, 20)
	doSendMagicEffect(position, config.effect)
	addEvent(removeBomba, config.duration * 1000, position, config.itemid)	
return true
end