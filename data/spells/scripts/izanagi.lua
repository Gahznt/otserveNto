local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 338)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, true)
 
function onCastSpell(cid, var)
local target = getCreatureTarget(cid)
local waittime1 = 225 -- Tempo de exhaustion
local storage1 = 115839
 
if exhaustion.check(cid, storage1) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, storage1) .. " segundos para usar o jutsu novamente.")
return false
end
 
doPlayerSetStorageValue(cid, 19332, 1)
doPlayerSendTextMessage(cid, 27, "Izanagi expira em 45 segundos.")
addEvent(doPlayerSetStorageValue, 45000, cid, 19332, 0)
addEvent(doPlayerSendTextMessage, 45000, cid, 27, "Seu izanagi perdeu o efeito.")
exhaustion.set(cid, storage1, waittime1)
return true
end