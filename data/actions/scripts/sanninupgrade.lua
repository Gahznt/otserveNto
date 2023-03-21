--[[
Script feito por Lordzetros para o fórum TibiaKing  - pedido do usuario Sotten
]]

local configItems = {
idItem = 2455, -- Id do item que sera responsavel em clickar em cima do set para transforma-lo
amountItem = 1, -- quantidade que sera removida apos ser usada no set para transformar
message = "Item transformado com sucesso!" -- mensagem quando o item for transformado
}

local set = { -- Sets - antigo e novo
oldHelmet = 11419, -- Antigo helmet, antes de transformar
oldArmor = 11420, -- Antiga armor, antes de transformar
oldLegs = 11421, -- Antiga legs, antes de transformar
oldBoots = 11422, -- Antiga boots, antes de transformar
newHelmet = 2456, -- Novo helmet, apos transformar
newArmor = 2479, -- Nova armor, apos transformar
newLegs = 2473, -- Nova legs, apos transformar
newBoots = 2474 -- Nova boots, apos transformar
}



function onUse(cid, item, fromPosition, item2, toPosition)

pos = getCreaturePosition(cid)
efeito = CONST_ME_EXPLOSIONAREA

if (item2.itemid == set.oldHelmet) and doPlayerRemoveItem(cid,configItems.idItem,configItems.amountItem) then
	doSendMagicEffect(pos, efeito)
	doCreatureSay(cid, configItems.message, TALKTYPE_ORANGE_1)
	return doTransformItem(item2.uid,set.newHelmet)
elseif (item2.itemid == set.oldArmor) and doPlayerRemoveItem(cid,configItems.idItem,configItems.amountItem) then
	doSendMagicEffect(pos, efeito)
	doCreatureSay(cid, configItems.message, TALKTYPE_ORANGE_1)
	return doTransformItem(item2.uid,set.newArmor)
elseif (item2.itemid == set.oldLegs) and doPlayerRemoveItem(cid,configItems.idItem,configItems.amountItem) then
	doSendMagicEffect(pos, efeito)
	doCreatureSay(cid, configItems.message, TALKTYPE_ORANGE_1)
	return doTransformItem(item2.uid,set.newLegs)
elseif (item2.itemid == set.oldBoots) and doPlayerRemoveItem(cid,configItems.idItem,configItems.amountItem) then
	doSendMagicEffect(pos, efeito)
	doCreatureSay(cid, configItems.message, TALKTYPE_ORANGE_1)	
	return doTransformItem(item2.uid,set.newBoots)

else
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Nao eh possivel fazer a transformacao neste item!")
	doSendMagicEffect(pos, CONST_ME_POFF)
	return true
end
return true
end