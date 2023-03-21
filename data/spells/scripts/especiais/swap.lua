local config = {
tempo = 5, --- tempo que dura o outfit
effect = 3 --- efeito que sai ao castar a spell
}


function onCastSpell(cid, var)
addEvent(doSetCreatureOutfit, 1, variantToNumber(var), getCreatureOutfit(cid), (config.tempo * 1000) - 1)
doSetCreatureOutfit(cid, getCreatureOutfit(variantToNumber(var)), config.tempo * 1000)
doSendMagicEffect(getThingPos(cid), config.effect)
addEvent(doSendMagicEffect, 1, getThingPos(variantToNumber(var)), config.effect)
addEvent(doTeleportThing, 1, variantToNumber(var), getThingPos(cid))
doTeleportThing(cid, getThingPos(variantToNumber(var)))
return true
end