local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -3.0, -700, -2.0, -800)
 
local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

 
function onCastSpell(cid, var)
local waittime = 1 -- Tempo de exhaustion
local storage = 67644

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
addEvent(doSendMagicEffect, 100, {x = pos.x+1, y = pos.y+1, z = pos.z}, 215)
addEvent(doSendMagicEffect, 500, {x = pos.x+1, y = pos.y+1, z = pos.z}, 215)
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 500, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 