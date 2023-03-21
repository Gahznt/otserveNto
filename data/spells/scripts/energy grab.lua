local config = {
walks = 8, -- qnts passos ele vai dar
delay = 200, -- de qnts em qnts milisegundos ele dá cada passo
speed = 400 -- velocidade que ele vai ficar enquanto estiver sob efeito do taunt
}

function onCastSpell(cid, var)
local itemid = 11322
local waittime = 180 -- Tempo de exhaustion
local storage = 6377
local poz = getCreaturePosition(cid) -- effeito no caster

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
if getPlayerItemCount(cid, itemid) >= 1 then
Taunt(cid, variantToNumber(var), config.delay, config.walks) 
doChangeSpeed(variantToNumber(var), (config.speed - getCreatureBaseSpeed(variantToNumber(var))))
addEvent(function() 
	if isCreature(variantToNumber(var)) then
		addEvent(doSendMagicEffect, 100, {x = poz.x+4, y = poz.y, z = poz.z}, 624)
		doChangeSpeed(variantToNumber(var), (-config.speed + getCreatureBaseSpeed(variantToNumber(var))))
	end
end, config.delay * (config.walks + 1))
exhaustion.set(cid, storage, waittime)
return true
else
return false, doPlayerSendCancel(cid, "Voce precisa de um Rinnegan Eye para executar este Jutsu !")
end
end 