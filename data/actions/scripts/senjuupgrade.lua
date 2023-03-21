--[[
Script feito por Lordzetros para o fórum TibiaKing  - pedido do usuario Sotten
]]

local configItems = {
idItem = 2454, -- Id do item que sera responsavel em clickar em cima do set para transforma-lo
amountItem = 1, -- quantidade que sera removida apos ser usada no set para transformar
message = "Item transformado com sucesso!" -- mensagem quando o item for transformado
}

local set = { -- Sets - antigo e novo
oldHelmet = 2467, -- Antigo helmet, antes de transformar
oldArmor = 2463, -- Antiga armor, antes de transformar
oldLegs = 2465, -- Antiga legs, antes de transformar
oldBoots = 2470, -- Antiga boots, antes de transformar
newHelmet = 2475, -- Novo helmet, apos transformar
newArmor = 2476, -- Nova armor, apos transformar
newLegs = 2477, -- Nova legs, apos transformar
newBoots = 2478 -- Nova boots, apos transformar
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