local config = {
pos = {x=189, y=156, z=9}, -- posição da aegis dimension
tempo = 15, -- tempo pra voltar
effect1 = 338, -- efeito ao morrer
effect2 = 338, -- efeito ao retornar a vida
storage = 19332
}




function onStatsChange(cid, attacker, type, combat, value)
if type == STATSCHANGE_HEALTHLOSS and value >= getCreatureHealth(cid) then
if getPlayerStorageValue(cid, config.storage) > 0 then
doPlayerSetStorageValue(cid, config.storage, (getPlayerStorageValue(cid, config.storage)-1))
addEvent(doTeleportThing, 1000*config.tempo, cid, getThingPos(cid), true)
addEvent(doSendMagicEffect, 1000*config.tempo, getThingPos(cid), config.effect2)
doSendMagicEffect(getThingPos(cid), config.effect1)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid) - getCreatureHealth(cid))
doCreatureAddMana(cid, getCreatureMaxMana(cid) - getCreatureMana(cid))
doTeleportThing(cid, config.pos)
if isCreature(attacker) then
doPlayerSendTextMessage(cid, 27, "Voce foi morto por ".. getCreatureName(attacker) ..". Agora e hora de voce se recuperar!")
end
if isPlayer(attacker) and isCreature(cid) then
doPlayerSendTextMessage(attacker, 27, "Voce matou ".. getCreatureName(cid) .."!")
end
for i = 1,config.tempo  do
addEvent(function()
if isCreature(cid) then
doPlayerSendTextMessage(cid,25,"Voce voltara em " .. config.tempo -i +1 .. " secundo(s)")
end
end, 1000*i)
end


return false
end
end
return true
end